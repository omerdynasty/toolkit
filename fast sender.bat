@echo off
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
:start
set /p msg=
set "message_text=%msg%"
curl -k -F "payload_json={\"content\": \"%message_text%\"}" %output%
goto start