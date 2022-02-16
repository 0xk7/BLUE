cd $HOME\Pictures

wget -o .\ar.zip "https://download.sysinternals.com/files/Autoruns.zip"
wget -o .\tv.zip "https://download.sysinternals.com/files/TCPView.zip"
wget -o .\sm.zip "https://download.sysinternals.com/files/Sysmon.zip"
wget -o .\pe.zip "https://download.sysinternals.com/files/ProcessExplorer.zip"
wget -o .\pm.zip "https://download.sysinternals.com/files/ProcessMonitor.zip"

wget -o .\gawr.exe “https://2.na.dl.wireshark.org/win64/Wireshark-win64-3.6.2.exe”
wget -o .\webint.exe “http://dl.google.com/chrome/install/375.126/chrome_installer.exe”

Compare-Object -ReferenceObject (Get-Service | Select-Object -ExpandProperty Name | % { $_ -replace "_[0-9a-f]{2,8}$" } ) -DifferenceObject (gci -path hklm:\system\currentcontrolset\services | % { $_.Name -Replace "HKEY_LOCAL_MACHINE\\","HKLM:\" } | ? { Get-ItemProperty -Path "$_" -name objectname -erroraction 'ignore' } | % { $_.substring(40) }) -PassThru | ?{$_.sideIndicator -eq "=>"}