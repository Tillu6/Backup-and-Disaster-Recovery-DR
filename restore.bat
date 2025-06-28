@echo off
:: Ask for filename
set /p FILENAME=Enter backup filename (e.g., policy_backup_2025-04-10-0200.zip):

:: Download from GCP
gcloud storage cp gs://policy-deployment-backups/%FILENAME% .

:: Extract
powershell Expand-Archive -Path %FILENAME% -DestinationPath restored

echo ✅ Backup extracted to 'restored' folder.
pause 


