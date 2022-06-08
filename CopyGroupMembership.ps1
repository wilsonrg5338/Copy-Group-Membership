#Author: Reggie Wilson
#Last Edited: 6/7/2022
#This script will one user's AD Group Membership to another user
cls

import-Module ActiveDirectory

Add-Type -AssemblyName System.Web


#Input username of user whose group membership will be copied
	$Username = Read-Host -Prompt "Enter username to copy group membership from"
	
#Confirm and Verify the user account to copy group membership from
	get-aduser $Username
	write-host "Press Enter to Continue if you would like to copy this user's group membership. Otherwise close this window."
	
	pause
	
#Inputer username of user who will copy the aforementioned user's group membership
	$Username1 = Read-Host -Prompt "Enter username to copy group membership to"
	
#Confirm and Verify the user account to copy group membership to
	get-aduser $Username1
	write-host "Press Enter to Continue if you would like this user's group membership to mirror the group membership of the username you previously entered. Otherwise close this window."
	
	pause


#Comment
	get-aduser $Username -properties memberof | select-object memberof -expandproperty memberof | add-adgroupmember -members $Username1
	
pause
