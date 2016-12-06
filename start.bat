@echo off
cd mysql
start mysql_start.bat
cd ../
cd php
echo "There seems to be an issue with non admins, if there is please run as admin."
start /B php.exe -S 0.0.0.0:8081 -t ..\webister-master\application\tmp\webister\interface
start /B php.exe -S 0.0.0.0:8080 -t ..\webister-master\application\tmp\webister\website
exit
