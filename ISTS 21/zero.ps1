netsh advfirewall reset
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

# ICMP
netsh advfirewall firewall add rule name=”ICMP” dir=in action=allow protocol=icmpv4:8,any
netsh advfirewall firewall add rule name=”ICMP” dir=out action=allow protocol=icmpv4:8,any

# Logging of Firewall
netsh advfirewall set allprofiles logging filename \Windows\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable 
netsh advfirewall set allprofiles settings inboundusernotification enable

# RDP - into my other boxes
#> netsh advfirewall firewall add rule name=”RDP” dir=out protocol=tcp remoteport=3389 action=allow
#> netsh advfirewall firewall add rule name=”RDP” dir=in protocol=tcp remoteport=3389 action=allow
