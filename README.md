# ThingSpeak Examples Using PowerShell Script
Send data to ThingSpeak from a Windows PowerShell Script

## Getting Started with ThingSpeak
ThingSpeak is an open source Internet of Things application and API to store and retrieve data from anything using HTTP over the Internet 
or via a Local Area Network.

## Sign Up for ThingSpeak
1. Sign Up for New User Account - https://thingspeak.com/users/sign_up
2. Create a new Channel by selecting Channels, My Channels, and then New Channel
3. Copy and save the ThingSpeak Write API Key and enter it into the PowerShell Script
DiskFreeSpace.ps1
4. When this script executes, DiskFreeSpace.ps1 will report the free space of the disk drive which will be passed as an command-line argument to a ThingSpeak Channel.

## Script Notes:
Place the DiskFreeSpace.ps1 Windows PowerShell script on your system.
1. Make sure you pass the the correct drive letter as an command-line argument, such as "C:" or "D:"
2. Make sure to enter your ThingSpeak Wite API Key for your Channel
