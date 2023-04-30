@echo off
color 50
title Webhook Writer
echo ================================================
echo This tool writes the webhook link to a file so that you can use my webhook-kit more conveniently,
echo and the entire webhook-kit reads and uses your webhook from this file.
echo ================================================
echo Press enter to continue & timeout /T -1 >nul
cls
echo ================================================
echo Now please paste your webhook link
echo ================================================
set /p link=
echo ================================================
cls
echo ================================================
echo Writing the webhook to the file...
echo ================================================
timeout /T 4 /NOBREAK>nul
echo %link% > webhook.txt
cls
echo ================================================
echo Reading webhook file...
echo ================================================
timeout /T 2 /NOBREAK>nul
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
cls
echo ================================================
echo %output%
echo ================================================
echo Sending test message...
echo ================================================
timeout /T 1 /NOBREAK>nul
timeout /T 2 /NOBREAK>nul
set "message_text=This message was automatically sent for testing by omerdynasty's Webhook-Kit."
curl -k -F "payload_json={\"content\": \"%message_text%\"}" %output%
cls
timeout /T 1 /NOBREAK>nul
echo ================================================
echo Message must have been sent
echo ================================================
start reader.bat
echo Press Enter to close the program 
timeout /T -1 >nul

