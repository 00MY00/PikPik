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

rem Test

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

GrabInfo.txt

del GrabInfo.txt
exit







