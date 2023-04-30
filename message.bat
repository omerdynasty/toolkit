@echo off
title Message Sender
echo =========================================================
echo This program simply sends a webhook message.
echo =========================================================
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
echo Webhook file read
echo =========================================================
echo Enter your message to be sent
echo =========================================================
set /p msg=
echo =========================================================
set "message_text=%msg%"
curl -k -F "payload_json={\"content\": \"%message_text%\"}" %output%
echo =========================================================
echo Complete.
echo =========================================================
pause
