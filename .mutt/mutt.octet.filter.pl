#!/usr/bin/perl
#
#     mutt.octet.filter.pl - Autoview octet filter for mutt
#     Copyright (C) 2002 Bruce J.A. Nourish <kode187@kode187.net>
# 
#     Concept and some code based on mutt.octet.filter:
#     Copyright (C) 1997,1998,1999,2000,2001 David A Pearson
#   
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the license, or 
#     (at your option) any later version.
#     
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#    
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
# 

### Declarations ###
sub DiscoverFileType;
sub RunMethod;
sub TryMailcap;
sub ParseMailcap;

### Variables ###
$mailcap_file = "$ENV{HOME}/.mutt/mailcap";
$try_mailcap = 1;

%method = (
      TAR     => 'tar tvvf "%s" 2> /dev/null',
      TGZ     => 'tar tzvvf "%s" 2> /dev/null',
      TBZ     => 'bzip2 -dc "%s" | tar -tvv -f- 2> /dev/null',
      GZIP    => 'gzip -dc "%s" 2> /dev/null',
      BZIP    => 'bzip2 -dc "%s" 2> /dev/null',
      ZIP     => 'unzip -l "%s" 2> /dev/null',
      ARJ     => 'unarj l "%s." 2> /dev/null',
      EXE     => 'echo %b: DOS/Windows executable',
      OBJ     => 'echo %b: DOS/Windows object file',
      LIB     => 'echo %b: MS-DOS program library',
      NG      => 'echo %b: Norton Guide Database',
      VCard   => 'cat "%s" | mutt.vcard.filter',
      TIF     => 'tiffinfo %s',
      MSWord  => 'catdoc "%s"',
      Object  => 'nm "%s"',
      RPM     => 'rpm -qip "%s"',
      TXT     => 'echo "[-- Statistics (lines words chars): "$(wc "%s")" --]"; echo; cat -v "%s"',
      Data    => 'echo %b: unprintable data',
);

# TODO: More stuff should be added here
#   <method key> => '<mime type>[;<mime type>;...]',"
%mime_equiv = (
      MSWord     => 'application/msword',
      HTML       => 'text/html',
      TAR	 => 'application/x-tar;application/tar',
);

%handler = (
	'\.tar$'      => 'TAR',    '\.tgz$'     => 'TGZ',
	'\.tar\.gz$'  => 'TGZ',	   '\.tar\.Z$'  => 'TGZ',
	'\.tar\.z$'   => 'TGZ',    '\.tbz2$'    => 'TBZ',
        '\.tar\.bz2$' => 'TBZ',	   '\.Z$'       => 'GZIP',
	'\.z$'        => 'GZIP',   '\.gz$'      => 'GZIP',
        '\.bz2$'      => 'BZIP',   '\.zip$'     => 'ZIP', 
	'\.ZIP$'      => 'ZIP',    '\.arj$'     => 'ARJ', 
	'\.ARJ$'      => 'ARJ',    '\.log$'     => 'TXT', 
	'\.LOG$'      => 'TXT',    '\.obj$'     => 'OBJ',   
	'\.OBJ$'      => 'OBJ',    '\.lib$'     => 'LIB', 
	'\.LIB$'      => 'LIB',	   '\.NG$'      => 'NG',   
	'\.ng$'       => 'NG', 	   '\.vcf$'     => 'VCard', 
	'\.tif$'      => 'TIF',	   '\.TIF$'     => 'TIF',   
        '\.doc$'      => 'MSWord', '\.DOC$'     => 'MSWord',
        '\.o$'        => 'Object', '\.rpm$'     => 'RPM',   
);

%x_handler = (
	'.*tar.*archive.*'       => 'TAR',
	'.*tar.*archive.*gzip.*' => 'TGZ',
	'.*gzip.*'               => 'GZIP',
	'.*ARJ.*archive.*data.*' => 'ARJ',
	'.*zip.*archive.*file.*' => 'ZIP',
	'.*DOS.*executable.*'    => 'EXE',
	'.*LSB.*executable.*'    => 'Object',
	'.*ascii.*text.*'        => 'TXT',
	'.*c.*program.*text.*'   => 'TXT',
	'.*8086.*reloc.*Micro.*' => 'OBJ',
	'.*MS-DOS.*prog.*lib.*'  => 'LIB',
	'.*data.*'               => 'Data',
	'.*'                     => 'TXT',
);

### Main ###

$filename = $ARGV[0];
if(!$filename) { die "Please specify a file on the command line\n"; }
$basename = $filename;
$_ = $filename;
$basename =~ s:(.*)/::;
if(!-e) { die "Please specify a file that EXISTS\n"; }
if(!-R) { die "It might help if I could READ the file...\n"; }
if(!-s) { print "[-- $basename: zero length file (huh?)--]\n\n"; }

$f=DiscoverFileType;
for $ext (sort { length($b) <=> length($a) } keys %handler) {
  if ($filename =~ /$ext/) { &RunMethod($handler{$ext} ); }
}
for $text (sort { length($b) <=> length($a) } keys %x_handler) {
  if ($f =~ /^$text/) { &RunMethod($x_handler{$text} ); }
}

### Functions ###

sub DiscoverFileType {
    $f=qx{file -z "$filename" 2> /dev/null};
    if ($? gt 0) { $f=qx{file "$filename" 2> /dev/null}; }
    @t=split(/ /, $f);
    shift @t;
    $f=join(' ', @t);
    chomp $f;
    $f =~ s/^ //;
    print "[-- $basename file type: \"$f\" --]\n\n";
    return $f;
}

sub TryMailcap {
    &ParseMailcap;
    # This conditional is required to stop perl warnings
    for (split(/;/, ($mime_equiv{$_[0]} ? $mime_equiv{$_[0]} : ''))) {
      if ($mime_methods{$_}) {
        return $mime_methods{$_};
      }
    }
    return $method{$_[0]};
}

# This parser knows just enough of mailcap to be dangerous
sub ParseMailcap {
    open(FILE, "$mailcap_file") || die "$!";
    while(<FILE>) {
      next if /^$/;
      next if /^#/;
      chomp;
      # Stolen from the perlsyn manpage
      if (s/\\$//) {
        $_ .= <FILE>;
        redo unless eof();
      }
      y/ \t/ /s;
      @tmp = split(/;/);
      $key = shift @tmp;
      for (@tmp) {
       if (s/copiousoutput//) {
          $mime_methods{$key}=$tmp[0];
 	}
      }
    }
    close FILE;
}

sub RunMethod {
    if ($try_mailcap == 1) {
       @command = &TryMailcap($_[0]);
    } else {
       @command = $method{$_[0]};
    }
    for (@command) {
      s/%s/$filename/g;
      s/%b/$basename/g;
    }
    system(@command);
    exit;
}

### End ###
