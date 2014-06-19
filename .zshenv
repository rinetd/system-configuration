# .zshenv


#set locale

# 设置输入法环境变量
# export GTK_IM_MODULE="ibus"
# export QT_IM_MODULE="ibus"
# export XMODIFIERS="@im=ibus"
export XIM=fcitx
export XIM_PROGRAM=/usr/bin/fcitx
export ICON="/usr/share/pixmaps/fcitx.png"
export XIM_ARGS="-D"
export PREFERENCE_PROGRAM=/usr/bin/fcitx-configtool
export SHORT_DESC="FCITX"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"



export LANG="zh_CN.UTF-8"
export LC_CTYPE="zh_CN.UTF-8"
export LC_NUMERIC="zh_CN.UTF-8"
export LC_TIME="zh_CN.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="zh_CN.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="zh_CN.UTF-8"
export LC_NAME="zh_CN.UTF-8"
export LC_ADDRESS="zh_CN.UTF-8"
export LC_TELEPHONE="zh_CN.UTF-8"
export LC_MEASUREMENT="zh_CN.UTF-8"
export LC_IDENTIFICATION="zh_CN.UTF-8"
export LC_ALL="en_US.UTF-8"

export LD_LIBRARY_PATH=/usr/local/lib

# export PATH




# 有些程序在公司的时候跟在家里的时候的设置是不一样的
if [ -f ~/.company ]; then
    source ~/.company
             # set enviroment to company
    export COMPUTER_ADDR=company
else
    export COMPUTER_ADDR=home
fi



