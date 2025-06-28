# Backup and Disaster Recovery (DR) Service

## 📌 Overview
This folder contains scripts and documentation for backing up the Policy Deployment Engine project and restoring it in case of failure. The backups are uploaded to a Google Cloud Storage bucket.

## 🔄 Backup Script (Windows)
- Archives `policies/`, `inputs/`, `templates/`, and `README.md`
- Uploads a timestamped `.zip` to `gs://policy-deployment-backups`

### ➕ How to Run
```cmd
cd Backup-DR
backup.bat
