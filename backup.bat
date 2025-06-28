@echo off
setlocal ENABLEEXTENSIONS

:: Set timestamp with zero-padded hour
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set TIMESTAMP=%%i

:: Define paths
set ROOT_DIR=%~dp0..
set BACKUP_DIR=%~dp0backups
set ARCHIVE_NAME=policy_backup_%TIMESTAMP%.zip
set BUCKET_NAME=gs://policy-deployment-backups

:: Create backup directory if it doesn't exist
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

:: Navigate to root directory
cd /d "%ROOT_DIR%"

:: Create ZIP archive of selected files/folders
powershell -Command "Compress-Archive -Path 'policies','inputs','templates','README.md' -DestinationPath '%BACKUP_DIR%\%ARCHIVE_NAME%'"

:: Upload to Google Cloud Storage
gcloud storage cp "%BACKUP_DIR%\%ARCHIVE_NAME%" %BUCKET_NAME%

:: Optional clean-up (delete the backup zip locally)
:: del "%BACKUP_DIR%\%ARCHIVE_NAME%"

echo ✅ Backup complete: %ARCHIVE_NAME%
endlocal
