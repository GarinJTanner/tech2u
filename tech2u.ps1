$Host.UI.RawUI.WindowTitle = "x32 FULLSCAN"
Function Set-WindowSize {
Param([int]$x=$host.ui.rawui.windowsize.width,
      [int]$y=$host.ui.rawui.windowsize.heigth)

    $size=New-Object System.Management.Automation.Host.Size($x,$y)
    $host.ui.rawui.WindowSize=$size   
}

Set-WindowSize 80 30
Write-Host '




					
 ______________________________________________________________________________					
   _____   _____    ____   _   _   ____    _   _        ____    ___    __  __ 					
  |_   _| | ____|  / ___| | | | | |___ \  | | | |      / ___|  / _ \  |  \/  | 					
    | |   |  _|   | |     | |_| |   __) | | | | |     | |     | | | | | |\/| | 					
    | |   | |___  | |___  |  _  |  / __/  | |_| |  _  | |___  | |_| | | |  | | 					
    |_|   |_____|  \____| |_| |_| |_____|  \___/  (_)  \____|  \___/  |_|  |_| 					
 ______________________________________________________________________________					
					
                           Give us a call! (888) 340-8324					
  =============================================================================				
                       Operating System Diagnostics and Repair					
  =============================================================================					
					
                         Please leave the machine turned on.					
					
					
'






#####################################################################
# Silent Install MalwareBytes 
# Download URL: https://www.malwarebytes.com/mwb-download/thankyou/

# Path for the workdir
$workdir = "c:\_RemoteTools_\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "" }
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "https://downloads.malwarebytes.com/file/mb3/"
$destination = "$workdir\mbam.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

# Start the installation

Start-Process -FilePath "$workdir\mbam.exe" -ArgumentList "/NOCANCEL /NORESTART /SILENT /SUPPRESSMSGBOXES /tasks="" /set hidereg on /noicons"

# Wait XX Seconds for the installation to finish

Start-Sleep -s 82

# Perform full scan

Start-Process -FilePath "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe" -ArgumentList "/update /fullscanterminate"


#####################################################################
# Silent Install HitmanPro
# Download URL: https://www.hitmanpro.com/en-us/downloads.aspx

# Path for the workdir
$workdir = "c:\_RemoteTools_\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists"}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Find OS type

$ostype = wmic os get osarchitecture

if ($ostype -like '*64*') {
# Download the installer

$source = "https://dl.surfright.nl/HitmanPro_x64.exe"
$destination = "$workdir\HitmanPro_x64.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}


Start-Sleep -s 60

# Start the scan

Start-Process -FilePath "$workdir\HitmanPro_X64.exe" -ArgumentList "/scan /noupdate /noinstall /log=C:\_RemoteTools_\hitmanpro.xml"

Start-Sleep -s 60

 }

else {


# Download the installer

$source = "https://dl.surfright.nl/HitmanPro.exe"
$destination = "$workdir\hitmanpro.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

Start-Sleep -s 60

# Start the scan

Start-Process -FilePath "$workdir\hitmanpro.exe" -ArgumentList "/scan /noupdate /noinstall /log=C:\_RemoteTools_\hitmanpro.xml"


}


#####################################################################
# Silent Install CCleaner 
# Download URL: http://download.piriform.com/ccsetup538.exe

# Path for the workdir
$workdir = "c:\_RemoteTools_\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists"}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "http://download.piriform.com/ccsetup538.exe"
$destination = "$workdir\ccsetup.exe"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest')
{
     Invoke-WebRequest $source -OutFile $destination
}
else
{
    $WebClient = New-Object System.Net.WebClient

# Start the installation

Start-Process -FilePath "$workdir\ccsetup.exe" -ArgumentList "/S /D=C:\_RemoteTools_\ccleaner"

exit
    $webclient.DownloadFile($source, $destination)
}

exit
