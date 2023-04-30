@echo off
color 47
title Data
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
timeout /T 1 /NOBREAK>nul
echo ================================================
echo Webhook file read
timeout /T 2 /NOBREAK>nul
echo ================================================
echo Loop point determined
echo ================================================
cls
:start
echo ================================================
echo Enter the command you want to get data
echo ================================================
set /p comd=
echo ================================================
echo ================================================
echo Sending command output on webhook...
echo ================================================
%comd% > data.txt
echo The desired command output has been written
timeout /T 2 /NOBREAK>nul
set "message_text=`%comd%`"
set "attachment=data.txt"
echo Data attached on message
timeout /T 2 /NOBREAK>nul
curl -k -F "payload_json={\"content\": \"%message_text%\"}" -F "file1=@%attachment%" %output%
echo Data sent via webhook
timeout /T 2 /NOBREAK>nul
del data.txt
echo Written data deleted
timeout /T 2 /NOBREAK>nul
echo ================================================
cls
goto start
