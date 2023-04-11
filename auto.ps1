$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script must be run as an administrator." -ForegroundColor Red
    exit
}

echo  "install chocolatey"
# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


echo  "install apps"
# Install apps
choco install git -y
choco install googlechrome -y 
choco install firefox -y
choco install 7zip -y
choco install adobereader -y
choco install zoom -y
choco install vlc -y 
choco install officeproplus2013 -y
choco install microsoft-teams -y
choco install anydesk.install -y
choco install spotify -y
choco install bitwarden -y


echo  "install PSWindowsUpdate"
# Install PSWindowsUpdate
Install-Module -Name PSWindowsUpdate -Force
#windows update
Install-WindowsUpdate -AcceptAll -IgnoreReboot

echo "add Windows Registry to enable Outlook 2013"
# Configure Outlook 2013 to work on Windows 10
## more info:https://learn.microsoft.com/en-us/microsoft-365/enterprise/modern-auth-for-office-2013-and-2016?view=o365-worldwide
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\15.0\Common\Identity" -Name "EnableADAL" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Office\15.0\Common\Identity" -Name "Version" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\Software\Microsoft\Exchange" -Name "AlwaysUseMSOAuthForAutoDiscover" -Value 1 -PropertyType DWORD -Force | Out-Null


echo "all done"