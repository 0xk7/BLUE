iptables -t mangle -F
iptables -t mangle -X
iptables -F
iptables -X

iptables -t mangle -P INPUT ACCEPT
iptables -t mangle -P OUTPUT ACCEPT

iptables -t mangle -A INPUT -p ICMP -j ACCEPT
iptables -t mangle -A OUTPUT -p ICMP -j ACCEPT

iptables -t mangle -A INPUT -i lo -j ACCEPT
iptables -t mangle -A OUTPUT -o lo -j ACCEPT

iptables -t mangle -A INPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A OUTPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

iptables -t mangle -A OUTPUT -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t mangle -A INPUT -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

iptables -t mangle -A INPUT -j DROP
iptables -t mangle -A OUTPUT -j DROP