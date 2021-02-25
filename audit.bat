#Local users and groups
net user > usr.txt
net localgroup > grp.txt

#Local admins
net localgroup “Administrators” > localadmins.txt

#Remote users
net localgroup “Remote Desktop Users” > remoteusers.txt

#Shares
net share > shares.txt

#Running services
net start > services.txt

#Processes
tasklist /svc /FO table > procs.txt

#.exe files
cmd> dir /B /S \*.exe > exes.txt

#Listening ports
cmd> netstat -ano | findstr LIST | findstr /V ::1 | findstr /V 127.0.0.1 > listeners.txt

#System32
cmd> dir /B /S \windows\system32 > 32.txt
