# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export PATH=$PATH:$HOME/bin
export LD_LIBRARY_PATH=/usr/local/lib 
export PATH

# check if the dea-read-only is exist
#if [ ! -d ~/dea-read-only ]; then
#    cd ~
#    svn checkout http://dea.googlecode.com/svn/trunk/ dea-read-only & # (或者下载Downloads页面的release,不过不是最新的)
#fi


# clear all file that end with "~"
# 这个应该放到关机的时候
# find ~/ -name "*~" | xargs rm -rf


# 执行我的crontab吧，让我有更多的时间做更有趣的事情
#crontab ~/.cron.d/crontab



