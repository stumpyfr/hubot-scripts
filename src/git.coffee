# Description:
#	git helper
# Commands:
#	(git cmd) - support pull, status and log command

module.exports = (robot) ->
  robot.respond /git (.+)/i, (msg) ->
    cmd = msg.match[1]
    if cmd == 'pull' or cmd == 'status' or cmd == 'log'
      @exec = require('child_process').exec
      command = 'cd ~/project/ && git ' + cmd

      @exec command, (error, stdout, stderr) ->
        msg.send error if error
        msg.send stdout if stdout
        msg.send stderr if stderr
     else
       msg.send 'Learn to use git!, only push, pull, status and log are supported here!'