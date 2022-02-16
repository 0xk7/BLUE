#Local users and groups
net user > lusr.txt
net localgroup > grp.txt

#Local admins
net localgroup “Administrators” > lad.txt

#Remote users
net localgroup “Remote Desktop Users” > rusr.txt

#Shares
net share > shr.txt

#Running services
net start > srv.txt

#Processes
tasklist /svc /FO table > procs.txt

#.exe files
dir /B /S \*.exe > xes.txt

#Listening ports
netstat -ano | findstr LIST | findstr /V ::1 | findstr /V 127.0.0.1 > list.txt

#System32
dir /B /S \windows\system32 > 32.txt
