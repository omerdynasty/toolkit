@echo off
color 10
title Webhook Reader
echo ================================================
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
echo %output%
echo ================================================
echo.
pause