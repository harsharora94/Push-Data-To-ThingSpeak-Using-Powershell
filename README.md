# ThingSpeak Examples Using PowerShell Script
Send data to ThingSpeak from a Windows PowerShell Script

## Getting Started with ThingSpeak
ThingSpeak is an open source Internet of Things application and API to store and retrieve data from anything using HTTP over the Internet 
or via a Local Area Network.

## Sign Up for ThingSpeak
Sign Up for New User Account - https://thingspeak.com/users/sign_up
Create a new Channel by selecting Channels, My Channels, and then New Channel
Copy and save the ThingSpeak Write API Key and enter it into the PowerShell Script
DiskFreeSpace.ps1
When this script executes, DiskFreeSpace.ps1 will report the free space of the disk drive which will be passed as an command-line argument 
to a ThingSpeak Channel.

## Script Notes:
Place the DiskFreeSpace.ps1 Windows PowerShell script on your system.
Make sure you pass the the correct drive letter as an command-line argument, such as "C:" or "D:"
Make sure to enter your ThingSpeak Wite API Key for your Channel
