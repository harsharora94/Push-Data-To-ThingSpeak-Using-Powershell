# -------------------------------------------------------------------------------------------------------------------------------------------------------
#  Name        		:	DiskFreeSpace.ps1
#  Author      		:	Harsh Arora
#  Description     	:	This powershell script gets disk size and disk free space of a particular DeviceID which will be passed as a Command-line Argument and 
#                       will report the disk free space of that disk drive to a ThingSpeak Channel accordingly. 
# -------------------------------------------------------------------------------------------------------------------------------------------------------

$DeviceID = $args[0]
$Logfile = "$env:SystemDrive\DiskFreeSpace.log"

function LogWrite([string]$logstring)
{
	$DateTime = Get-Date -Format g
	Add-content $Logfile -value "$DateTime $logstring"
}

# Get Disk Size and Disk Free Space
$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='$DeviceID'" | Select-Object Size,FreeSpace

LogWrite "Disk Size and Free Space of DeviceID '$DeviceID': $disk" 

# Format Free Space into Gigabytes
$disk.DiskFreeSpace = $disk.DiskFreeSpace / 1Gb
$disk.DiskFreeSpace = [math]::Round($disk.DiskFreeSpace, 2)
$disk.DiskFreeSpace

LogWrite "Formatted Free Space for DeviceID '$DeviceID' into Gigabytes: '$disk.DiskFreeSpace'" 

# ThingSpeak Write API Key (Replace with your key)
$key = "xxxxxxxxxxxxxxxx"

# ThingSpeak URL
$url = "https://api.thingspeak.com/update?key=" + $key + "&field1=" + $disk.DiskFreeSpace

# Send Disk Free Space to ThingSpeak
$HTTP_Client = new-object net.webclient
$HTTP_Response = $HTTP_Client.DownloadString($url)

# Check Rate Limit and Display Results
If ($HTTP_Response -ne '0') 
{
  LogWrite "ThingSpeak Entry ID:" $HTTP_Response
  LogWrite "Disk Free Space:" $disk.DiskFreeSpace "GB"
}
else 
{
  LogWrite "Channel Update Failed - Check Rate Limit"
}