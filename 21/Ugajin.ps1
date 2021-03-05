> netsh advfirewall reset
> netsh advfirewall set allprofiles state on
> netsh advfirewall firewall delete rule name=all
> netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

> netsh advfirewall firewall add rule name=”ICMP-in” dir=in action=allow protocol=icmpv4:8,any
> netsh advfirewall firewall add rule name=”ICMP-out” dir=out action=allow protocol=icmpv4:8,any

> netsh advfirewall firewall add rule name=”WinRM” dir=out protocol=tcp remoteport=5985 action=allow
> netsh advfirewall firewall add rule name=”WinRM” dir=in protocol=tcp remoteport=5985 action=allow

netsh advfirewall set allprofiles logging filename $HOME\Pictures\fw.log
netsh advfirewall set allprofiles logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable