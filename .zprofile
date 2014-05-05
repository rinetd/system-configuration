# .zprofile
#

#export PATH=${PATH/:\/home\/vinurs\/bin/}

# User specific environment and startup programs



# clear all file that end with "~"
# 这个应该放到关机的时候
# find ~/ -name "*~" | xargs rm -rf


# 执行我的crontab吧，让我有更多的时间做更有趣的事情
crontab ~/.cron.d/crontab
