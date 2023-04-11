# Office PC Setup Script

This script automates the installation and configuration of some common software and settings for office PCs. It requires PowerShell 5.1 or higher.

---
## How to use

1. Download the auto.ps1 file from the repository and save it to a local folder.

2. Open PowerShell as an administrator and run the following command to enable the execution policy for remote signed scripts:
```powershell
Set-ExecutionPolicy RemoteSigned
```

3. Navigate to the folder where you saved the auto.ps1 file and run it:

```powershell
.\auto.ps1
```

4. Follow the instructions on the screen and wait for the script to complete.

5. you may want to change the execution policy back to the default value:
```powershell
Set-ExecutionPolicy -Scope LocalMachine
```

6. Restart your PC to apply the changes.
