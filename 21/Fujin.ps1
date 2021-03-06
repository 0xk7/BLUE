netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

netsh advfirewall firewall add rule name=”ICMP-in” dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name=”ICMP-out” dir=out action=allow protocol=icmpv4:8,any

netsh advfirewall firewall add rule name="RDP" dir=in protocol=tcp remoteport=3389 action=allow remoteip=10.2.1.3
netsh advfirewall firewall add rule name="RDP" dir=out protocol=tcp remoteport=3389 action=allow remoteip=10.2.1.3

netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-In)" dir=in protocol=tcp localport=5985 action=allow
netsh advfirewall firewall add rule name="Windows Remote Management (HTTP-Out)" dir=out protocol=tcp localport=5985 action=allow

netsh advfirewall firewall add rule name="HTTP-in" dir=in protocol=tcp localport=8081 action=allow
netsh advfirewall firewall add rule name="HTTP-out" dir=out protocol=tcp localport=8081 action=allow

netsh advfirewall firewall add rule name="Database-in" dir=in protocol=tcp remoteport=3306 action=allow remoteip=172.16.2.11
netsh advfirewall firewall add rule name="Database-out" dir=out protocol=tcp remoteport=3306 action=allow remoteip=172.16.2.11

netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=udp remoteport=53
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=udp localport=53

netsh advfirewall firewall add rule name="AD-tcp-in" dir=in action=allow protocol=tcp remoteport=389,445,88,135,3268  
netsh advfirewall firewall add rule name="AD-udp-in" dir=in action=allow protocol=udp remoteport=389,445,88,135,123  

netsh advfirewall firewall add rule name="AD-tcp-out" dir=out action=allow protocol=tcp remoteport=389,445,88,135,3268 
netsh advfirewall firewall add rule name="AD-udp-out" dir=out action=allow protocol=udp remoteport=389,445,88,135,123


netsh advfirewall set allprofiles logging filename $HOME\Pictures\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable

Start-Sleep 10

netsh advfirewall reset