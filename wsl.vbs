'win + R, input shell:startup
Set ws = CreateObject("Wscript.Shell")
ws.run "wsl -d ubuntu -u root /etc/init.d/ssh start", vbhide
ws.run "wsl -d ubuntu -u root /etc/init.d/cron start", vbhide