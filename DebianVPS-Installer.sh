#!/bin/bash
# VPS Installer
# Script by XAM
#
# Illegal selling and redistribution of this script is strictly prohibited
# Please respect author's Property
# Binigay sainyo ng libre, ipamahagi nyo rin ng libre.
#
#

 # Now check if our machine is in root user, if not, this script exits
 # If you're on sudo user, run `sudo su -` first before running this script
if [[ $EUID -ne 0 ]];then
 ScriptMessage
 echo -e "[\e[1;31mError\e[0m] This script must be run as root, exiting..."
 exit 1
fi

MyScriptName='XAMJYSS143 Script'

# OpenSSH Ports
SSH_Port1='22'
SSH_Port2='225'

# OpenSSH Ports
WS_Port1='80'
WS_Port2='8080'

# Dropbear Ports
Dropbear_Port1='900'
Dropbear_Port2='990'

# Stunnel Ports
Stunnel_Port1='443' # through Dropbear
Stunnel_Port2='144' # through OpenSSH
Stunnel_Port3='142' # through OpenVPN

# OpenVPN Ports
OpenVPN_Port1='110'
OpenVPN_Port2='25222'
OpenVPN_Port3='1194'
OpenVPN_Port4='69' # take note when you change this port, openvpn sun noload config will not work

# Privoxy Ports (must be 1024 or higher)
Proxy_Port1'8080'
Proxy_Port1='8000'
Privoxy_Port1='6969'
Privoxy_Port2='9696'
# OpenVPN Config Download Port
OvpnDownload_Port='86' # Before changing this value, please read this document. It contains all unsafe ports for Google Chrome Browser, please read from line #23 to line #89: https://chromium.googlesource.com/chromium/src.git/+/refs/heads/master/net/base/port_util.cc

# Server local time
MyVPS_Time='Asia/Manila'
#############################


#############################
#############################
## All function used for this script
#############################
## WARNING: Do not modify or edit anything
## if you did'nt know what to do.
## This part is too sensitive.
#############################
#############################
 apt-get update
 apt-get upgrade -y
 apt-get install lolcat -y 
 gem install lolcat
 sudo apt install python -y
 clear
[[ ! "$(command -v curl)" ]] && apt install curl -y -qq
[[ ! "$(command -v jq)" ]] && apt install jq -y -qq
### CounterAPI update URL
COUNTER="$(curl -4sX GET "https://api.countapi.xyz/hit/BonvScripts/DebianVPS-Installer" | jq -r '.value')"

IPADDR="$(curl -4skL http://ipinfo.io/ip)"

GLOBAL_API_KEY="03d0feacc806be806ec10d2914b77dab0de64"
CLOUDFLARE_EMAIL="mediatekvpn04@gmail.com"
DOMAIN_NAME_TLD="dextereskakarte.shop"
DOMAIN_ZONE_ID="8c86e28dbcf561319cc3191a6036f6fb"
### DNS hostname / Payload here
## Setting variable

####
## Creating file dump for DNS Records 
TMP_FILE='/tmp/abonv.txt'
curl -sX GET "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records?type=A&count=1000&per_page=1000" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "Content-Type: application/json" | python -m json.tool > "$TMP_FILE"

## Getting Existed DNS Record by Locating its IP Address "content" value
CHECK_IP_RECORD="$(cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.content' | awk '!a[$0]++')"

cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.name' | awk '!a[$0]++' | head -n1 > /tmp/abonv_existed_hostname

cat < "$TMP_FILE" | jq '.result[]' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' | jq '. | select(.content=='\"$IPADDR\"')' | jq -r '.id' | awk '!a[$0]++' | head -n1 > /tmp/abonv_existed_dns_id

function ExistedRecord(){
 MYDNS="$(cat /tmp/abonv_existed_hostname)"
 MYDNS_ID="$(cat /tmp/abonv_existed_dns_id)"
}


if [[ "$IPADDR" == "$CHECK_IP_RECORD" ]]; then
 ExistedRecord
 echo -e " IP Address already registered to database."
 echo -e " DNS: $MYDNS"
 echo -e " DNS ID: $MYDNS_ID"
 echo -e ""
 else

PAYLOAD="ws"
echo -e "Your IP Address:\033[0;35m $IPADDR\033[0m"
read -p "Enter desired DNS: "  servername
read -p "Enter desired servername: "  servernames
### Creating a DNS Record
function CreateRecord(){
TMP_FILE2='/tmp/abonv2.txt'
TMP_FILE3='/tmp/abonv3.txt'
curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"A\",\"name\":\"$servername.$PAYLOAD\",\"content\":\"$IPADDR\",\"ttl\":86400,\"proxied\":false}" | python -m json.tool > "$TMP_FILE2"

cat < "$TMP_FILE2" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv22.txt
rm -f "$TMP_FILE2"
mv /tmp/abonv22.txt "$TMP_FILE2"

MYDNS="$(cat < "$TMP_FILE2" | jq -r '.name')"
MYDNS_ID="$(cat < "$TMP_FILE2" | jq -r '.id')"
curl -sX POST "https://api.cloudflare.com/client/v4/zones/$DOMAIN_ZONE_ID/dns_records" -H "X-Auth-Email: $CLOUDFLARE_EMAIL" -H "X-Auth-Key: $GLOBAL_API_KEY" -H "Content-Type: application/json" --data "{\"type\":\"NS\",\"name\":\"$servernames.$PAYLOAD\",\"content\":\"$MYDNS\",\"ttl\":1,\"proxied\":false}" | python -m json.tool > "$TMP_FILE3"

cat < "$TMP_FILE3" | jq '.result' | jq 'del(.meta)' | jq 'del(.created_on,.locked,.modified_on,.proxiable,.proxied,.ttl,.type,.zone_id,.zone_name)' > /tmp/abonv33.txt
rm -f "$TMP_FILE3"
mv /tmp/abonv33.txt "$TMP_FILE3"

MYNS="$(cat < "$TMP_FILE3" | jq -r '.name')"
MYNS_ID="$(cat < "$TMP_FILE3" | jq -r '.id')"
echo "$MYNS" > nameserver.txt
}

 CreateRecord
 echo -e " Registering your IP Address.."
 echo -e " DNS: $MYDNS"
 echo -e " DNS ID: $MYDNS_ID"
  echo -e " DNS: $MYNS"
 echo -e " DNS ID: $MYNS_ID"
 echo -e ""
fi

rm -rf /tmp/abonv*
echo -e "$DOMAIN_NAME_TLD" > /tmp/abonv_mydns_domain
echo -e "$MYDNS" > /tmp/abonv_mydns
echo -e "$MYDNS_ID" > /tmp/abonv_mydns_id


function  Instupdate() {
 export DEBIAN_FRONTEND=noninteractive


 apt install fail2ban -y

 # Removing some firewall tools that may affect other services
 # apt-get remove --purge ufw firewalld -y

 # Installing some important machine essentials
 apt-get install nano wget curl zip unzip tar gzip p7zip-full bc rc openssl cron net-tools dnsutils dos2unix screen bzip2 ccrypt -y

 # Now installing all our wanted services
 apt-get install dropbear stunnel4 privoxy ca-certificates nginx ruby apt-transport-https lsb-release squid screenfetch -y

 # Installing all required packages to install Webmin
 apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python dbus libxml-parser-perl -y
 apt-get install shared-mime-info jq -y

 # Installing a text colorizer


 # Trying to remove obsolette packages after installation
 apt-get autoremove -y

 # Installing OpenVPN by pulling its repository inside sources.list file
 #rm -rf /etc/apt/sources.list.d/openvpn*
 echo "deb http://build.openvpn.net/debian/openvpn/stable $(lsb_release -sc) main" >/etc/apt/sources.list.d/openvpn.list && apt-key del E158C569 && wget -O - https://swupdate.openvpn.net/repos/repo-public.gpg | apt-key add -
 wget -qO security-openvpn-net.asc "https://keys.openpgp.org/vks/v1/by-fingerprint/F554A3687412CFFEBDEFE0A312F5F7B42F2B01E7" && gpg --import security-openvpn-net.asc
 apt-get update -y
 apt-get install openvpn -y
}

## Running FFSend installation in background
rm -rf {/usr/bin/ffsend,/usr/local/bin/ffsend}
printf "%b\n" "\e[32m[\e[0mInfo\e[32m]\e[0m\e[97m running FFSend installation on background\e[0m"
screen -S ffsendinstall -dm bash -c "curl -4skL "https://github.com/timvisee/ffsend/releases/download/v0.2.65/ffsend-v0.2.65-linux-x64-static" -o /usr/bin/ffsend && chmod a+x /usr/bin/ffsend"
hostnamectl set-hostname localhost &> /dev/null
printf "%b\n" "\e[32m[\e[0mInfo\e[32m]\e[0m\e[97m running DDoS-deflate installation on background\e[0m"
cat <<'ddosEOF'> /tmp/install-ddos.bash
#!/bin/bash
if [[ -e /etc/ddos ]]; then
 printf "%s\n" "DDoS-deflate already installed" && exit 1
else
 curl -4skL "https://github.com/jgmdev/ddos-deflate/archive/master.zip" -o ddos.zip
 unzip -qq ddos.zip
 rm -rf ddos.zip
 cd ddos-deflate-master
 echo -e "/r/n/r/n"
 ./install.sh &> /dev/null
 cd .. && rm -rf ddos-deflate-master
 systemctl start ddos &> /dev/null
 systemctl enable ddos &> /dev/null
fi
ddosEOF
screen -S ddosinstall -dm bash -c "bash /tmp/install-ddos.bash && rm -f /tmp/install-ddos.bash"

printf "%b\n" "\e[32m[\e[0mInfo\e[32m]\e[0m\e[97m running Iptables configuration on background\e[0m"
cat <<'iptEOF'> /tmp/iptables-config.bash
#!/bin/bash
function ip_address(){
  local IP="$( ip addr | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -Ev "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1 )"
  [ -z "${IP}" ] && IP="$(curl -4s ipv4.icanhazip.com)"
  [ -z "${IP}" ] && IP="$(curl -4s ipinfo.io/ip)"
  [ ! -z "${IP}" ] && echo "${IP}" || echo 'ipaddress'
}
IPADDR="$(ip_address)"
PNET="$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1)"
CIDR="172.29.0.0/16"
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
iptables -A INPUT -s $IPADDR -p tcp -m multiport --dport 1:65535 -j ACCEPT
iptables -A INPUT -s $IPADDR -p udp -m multiport --dport 1:65535 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j REJECT   
iptables -A FORWARD -p tcp --dport 25 -j REJECT
iptables -A OUTPUT -p tcp --dport 25 -j REJECT
iptables -I FORWARD -s $CIDR -j ACCEPT
iptables -t nat -A POSTROUTING -s $CIDR -o $PNET -j MASQUERADE
iptables -t nat -A POSTROUTING -s $CIDR -o $PNET -j SNAT --to-source $IPADDR
iptables -A INPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A INPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A INPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A INPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A INPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A INPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A FORWARD -m string --algo bm --string ".torrent" -j REJECT
iptables -A FORWARD -m string --algo bm --string "torrent" -j REJECT
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "BitTorrent protocol" -j REJECT
iptables -A OUTPUT -m string --algo bm --string ".torrent" -j REJECT
iptables -A OUTPUT -m string --algo bm --string "torrent" -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "BitTorrent protocol" --algo kmp -j REJECT
iptables -A OUTPUT -m string --string "bittorrent-announce" --algo kmp -j REJECT
iptables-save > /etc/iptables/rules.v4
iptEOF
screen -S configIptables -dm bash -c "bash /tmp/iptables-config.bash && rm -f /tmp/iptables-config.bash"

printf "%b\n" "\e[32m[\e[0mInfo\e[32m]\e[0m\e[97m running BadVPN-udpgw installation on background\e[0m"
cat <<'badvpnEOF'> /tmp/install-badvpn.bash
#!/bin/bash
if [[ -e /usr/local/bin/badvpn-udpgw ]]; then
 printf "%s\n" "BadVPN-udpgw already installed"
 exit 1
else
 curl -4skL "https://github.com/ambrop72/badvpn/archive/4b7070d8973f99e7cfe65e27a808b3963e25efc3.zip" -o /tmp/badvpn.zip
 unzip -qq /tmp/badvpn.zip -d /tmp && rm -f /tmp/badvpn.zip
 cd /tmp/badvpn-4b7070d8973f99e7cfe65e27a808b3963e25efc3
 cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1 &> /dev/null
 make install &> /dev/null
 rm -rf /tmp/badvpn-4b7070d8973f99e7cfe65e27a808b3963e25efc3
 cat <<'EOFudpgw' > /lib/systemd/system/badvpn-udpgw.service
[Unit]
Description=BadVPN UDP Gateway Server daemon
Wants=network.target
After=network.target

[Service]
ExecStart=/usr/local/bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 4000 --max-connections-for-client 4000 --loglevel info
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOFudpgw

systemctl daemon-reload &>/dev/null
systemctl restart badvpn-udpgw.service &>/dev/null
systemctl enable badvpn-udpgw.service &>/dev/null

fi
badvpnEOF
screen -S badvpninstall -dm bash -c "bash /tmp/install-badvpn.bash && rm -f /tmp/install-badvpn.bash"
}

function InstSSH(){
 # Removing some duplicated sshd server configs
 rm -f /etc/ssh/sshd_config*

 # Creating a SSH server config using cat eof tricks
 cat <<'MySSHConfig' > /etc/ssh/sshd_config
# My OpenSSH Server config
Port myPORT1
Port myPORT2
AddressFamily inet
ListenAddress 0.0.0.0
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
PermitRootLogin yes
MaxSessions 1024
PubkeyAuthentication yes
PasswordAuthentication yes
PermitEmptyPasswords no
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
ClientAliveInterval 240
ClientAliveCountMax 2
UseDNS no
Banner /etc/banner
AcceptEnv LANG LC_*
Subsystem   sftp  /usr/lib/openssh/sftp-server
MySSHConfig

 # Now we'll put our ssh ports inside of sshd_config
 sed -i "s|myPORT1|$SSH_Port1|g" /etc/ssh/sshd_config
 sed -i "s|myPORT2|$SSH_Port2|g" /etc/ssh/sshd_config

 # Download our SSH Banner
 rm -f /etc/banner
 wget -qO /etc/banner "$SSH_Banner"
 dos2unix -q /etc/banner

 # My workaround code to remove `BAD Password error` from passwd command, it will fix password-related error on their ssh accounts.
 sed -i '/password\s*requisite\s*pam_cracklib.s.*/d' /etc/pam.d/common-password
 sed -i 's/use_authtok //g' /etc/pam.d/common-password

 # Some command to identify null shells when you tunnel through SSH or using Stunnel, it will fix user/pass authentication error on HTTP Injector, KPN Tunnel, eProxy, SVI, HTTP Proxy Injector etc ssh/ssl tunneling apps.
 sed -i '/\/bin\/false/d' /etc/shells
 sed -i '/\/usr\/sbin\/nologin/d' /etc/shells
 echo '/bin/false' >> /etc/shells
 echo '/usr/sbin/nologin' >> /etc/shells

 # Restarting openssh service
 systemctl restart ssh

 # Removing some duplicate config file
 rm -rf /etc/default/dropbear*

 # creating dropbear config using cat eof tricks
 cat <<'MyDropbear' > /etc/default/dropbear
# My Dropbear Config
NO_START=0
DROPBEAR_PORT=PORT01
DROPBEAR_EXTRA_ARGS="-p PORT02"
DROPBEAR_BANNER="/etc/banner"
DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"
DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"
DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"
DROPBEAR_RECEIVE_WINDOW=65536
MyDropbear

 # Now changing our desired dropbear ports
 sed -i "s|PORT01|$Dropbear_Port1|g" /etc/default/dropbear
 sed -i "s|PORT02|$Dropbear_Port2|g" /etc/default/dropbear

 # Restarting dropbear service
 systemctl restart dropbear
}

function InsStunnel(){
 StunnelDir=$(ls /etc/default | grep stunnel | head -n1)

 # Creating stunnel startup config using cat eof tricks
cat <<'MyStunnelD' > /etc/default/$StunnelDir
# My Stunnel Config
ENABLED=1
FILES="/etc/stunnel/*.conf"
OPTIONS="/etc/banner"
BANNER="/etc/banner"
PPP_RESTART=0
# RLIMITS="-n 4096 -d unlimited"
RLIMITS=""
MyStunnelD

 # Removing all stunnel folder contents
 rm -rf /etc/stunnel/*

 # Creating stunnel certifcate using openssl
 openssl req -new -x509 -days 9999 -nodes -subj "/C=PH/ST=NCR/L=Manila/O=$MyScriptName/OU=$MyScriptName/CN=$MyScriptName" -out /etc/stunnel/stunnel.pem -keyout /etc/stunnel/stunnel.pem &> /dev/null
##  > /dev/null 2>&1

 # Creating stunnel server config
 cat <<'MyStunnelC' > /etc/stunnel/stunnel.conf
# My Stunnel Config
pid = /var/run/stunnel.pid
cert = /etc/stunnel/stunnel.pem
client = no
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
TIMEOUTclose = 0
[stunnel]
connect = 127.0.0.1:WS_Port1
accept = WS_Port2
[dropbear]
accept = Stunnel_Port1
connect = 127.0.0.1:dropbear_port_c
[openssh]
accept = Stunnel_Port2
connect = 127.0.0.1:openssh_port_c
[openvpn]
accept = Stunnel_Port3
connect = 127.0.0.1:MyOvpnPort3
MyStunnelC

 # setting stunnel ports
 sed -i "s|WS_Port1|$WS_Port1|g" /etc/stunnel/stunnel.conf
 sed -i "s|WS_Port2|$WS_Port2|g" /etc/stunnel/stunnel.conf
 sed -i "s|MyOvpnPort3|$OpenVPN_Port3|g" /etc/stunnel/stunnel.conf
 sed -i "s|Stunnel_Port1|$Stunnel_Port1|g" /etc/stunnel/stunnel.conf
 sed -i "s|dropbear_port_c|$(netstat -tlnp | grep -i dropbear | awk '{print $4}' | cut -d: -f2 | xargs | awk '{print $2}' | head -n1)|g" /etc/stunnel/stunnel.conf
 sed -i "s|Stunnel_Port2|$Stunnel_Port2|g" /etc/stunnel/stunnel.conf
 sed -i "s|openssh_port_c|$(netstat -tlnp | grep -i ssh | awk '{print $4}' | cut -d: -f2 | xargs | awk '{print $2}' | head -n1)|g" /etc/stunnel/stunnel.conf
 sed -i "s|Stunnel_Port3|$Stunnel_Port3|g" /etc/stunnel/stunnel.conf
 sed -i "s|openssh_port_c|$(netstat -tlnp | grep -i ssh | awk '{print $4}' | cut -d: -f2 | xargs | awk '{print $2}' | head -n1)|g" /etc/stunnel/stunnel.conf

 # Restarting stunnel service
 systemctl restart $StunnelDir

}

function ConfigOpenVPN(){
echo -e "[\e[32mInfo\e[0m] Configuring OpenVPN server.."
if [[ ! -e /etc/openvpn ]]; then
 mkdir -p /etc/openvpn
 else
 rm -rf /etc/openvpn/*
fi
mkdir -p /etc/openvpn/server
mkdir -p /etc/openvpn/client

cat <<'EOFovpn1' > /etc/openvpn/server/server_tcp.conf
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
port 1194
dev tun
proto tcp
ca /etc/openvpn/ca.crt
cert /etc/openvpn/bonvscripts.crt
key /etc/openvpn/bonvscripts.key
dh none
persist-tun
persist-key
persist-remote-ip
duplicate-cn
cipher none
ncp-disable
auth none
comp-lzo
tun-mtu 1500
reneg-sec 0
plugin PLUGIN_AUTH_PAM /etc/pam.d/login
verify-client-cert none
username-as-common-name
max-clients 4080
topology subnet
server 172.29.0.0 255.255.240.0
push "redirect-gateway def1"
keepalive 5 30
status /etc/openvpn/tcp_stats.log
log /etc/openvpn/tcp.log
verb 2
script-security 2
socket-flags TCP_NODELAY
push "socket-flags TCP_NODELAY"
push "dhcp-option DNS 1.0.0.1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 8.8.4.4"
push "dhcp-option DNS 8.8.8.8"
EOFovpn1
cat <<'EOFovpn2' > /etc/openvpn/server/server_udp.conf
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
port 25222
dev tun
proto udp
ca /etc/openvpn/ca.crt
cert /etc/openvpn/bonvscripts.crt
key /etc/openvpn/bonvscripts.key
dh none
persist-tun
persist-key
persist-remote-ip
duplicate-cn
cipher none
ncp-disable
auth none
comp-lzo
tun-mtu 1500
float
fast-io
reneg-sec 0
plugin PLUGIN_AUTH_PAM /etc/pam.d/login
verify-client-cert none
username-as-common-name
max-clients 4080
topology subnet
server 172.29.16.0 255.255.240.0
push "redirect-gateway def1"
keepalive 5 30
status /etc/openvpn/udp_stats.log
log /etc/openvpn/udp.log
verb 2
script-security 2
push "dhcp-option DNS 1.0.0.1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 8.8.4.4"
push "dhcp-option DNS 8.8.8.8"
EOFovpn2
cat <<'EOFovpn3' > /etc/openvpn/server/ec_server_tcp.conf
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
port 25980
proto tcp
dev tun
ca /etc/openvpn/ec_ca.crt
cert /etc/openvpn/ec_bonvscripts.crt
key /etc/openvpn/ec_bonvscripts.key
dh none
persist-tun
persist-key
persist-remote-ip
duplicate-cn
cipher none
ncp-disable
auth none
compress lz4
push "compress lz4"
tun-mtu 1500
reneg-sec 0
plugin PLUGIN_AUTH_PAM /etc/pam.d/login
verify-client-cert none
username-as-common-name
max-clients 4080
topology subnet
server 172.29.32.0 255.255.240.0
push "redirect-gateway def1"
keepalive 5 30
tls-server
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
status /etc/openvpn/ec_tcp_stats.log
log /etc/openvpn/ec_tcp.log
verb 2
script-security 2
socket-flags TCP_NODELAY
push "socket-flags TCP_NODELAY"
push "dhcp-option DNS 1.0.0.1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 8.8.4.4"
push "dhcp-option DNS 8.8.8.8"
EOFovpn3
cat <<'EOFovpn4' > /etc/openvpn/server/ec_server_udp.conf
# ©BonvScripts
# https://t.me/BonvScripts 
# https://phcorner.net/threads/739298
# EC type OpenVPN Server
# Built for Performance
port 25985
proto udp
dev tun
ca /etc/openvpn/ec_ca.crt
cert /etc/openvpn/ec_bonvscripts.crt
key /etc/openvpn/ec_bonvscripts.key
dh none
persist-tun
persist-key
persist-remote-ip
duplicate-cn
cipher none
ncp-disable
auth none
compress lz4
push "compress lz4"
tun-mtu 1500
float
fast-io
reneg-sec 0
plugin PLUGIN_AUTH_PAM /etc/pam.d/login
verify-client-cert none
username-as-common-name
max-clients 4080
topology subnet
server 172.29.48.0 255.255.240.0
push "redirect-gateway def1"
keepalive 5 30
tls-server
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
status /etc/openvpn/ec_udp_stats.log
log /etc/openvpn/ec_udp.log
verb 2
script-security 2
push "dhcp-option DNS 1.0.0.1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 8.8.4.4"
push "dhcp-option DNS 8.8.8.8"
EOFovpn4

mkdir /etc/openvpn/easy-rsa
mkdir /etc/openvpn/easy-rsa-ec

curl -4skL "https://raw.githubusercontent.com/Bonveio/BonvScripts/master/bonvscripts-easyrsa.zip" -o /etc/openvpn/easy-rsa/rsa.zip 2> /dev/null
curl -4skL "https://raw.githubusercontent.com/Bonveio/BonvScripts/master/bonvscripts-easyrsa-ec.zip" -o /etc/openvpn/easy-rsa-ec/rsa.zip 2> /dev/null

unzip -qq /etc/openvpn/easy-rsa/rsa.zip -d /etc/openvpn/easy-rsa
unzip -qq /etc/openvpn/easy-rsa-ec/rsa.zip -d /etc/openvpn/easy-rsa-ec

rm -f /etc/openvpn/easy-rsa/rsa.zip
rm -f /etc/openvpn/easy-rsa-ec/rsa.zip

cd /etc/openvpn/easy-rsa
chmod +x easyrsa
./easyrsa build-server-full server nopass &> /dev/null
cp pki/ca.crt /etc/openvpn/ca.crt
cp pki/issued/server.crt /etc/openvpn/bonvscripts.crt
cp pki/private/server.key /etc/openvpn/bonvscripts.key

cd /etc/openvpn/easy-rsa-ec
chmod +x easyrsa
./easyrsa build-server-full server nopass &> /dev/null
cp pki/ca.crt /etc/openvpn/ec_ca.crt
cp pki/issued/server.crt /etc/openvpn/ec_bonvscripts.crt
cp pki/private/server.key /etc/openvpn/ec_bonvscripts.key

cd ~/ && echo '' > /var/log/syslog

cat <<'NUovpn' > /etc/openvpn/server/server.conf
 ### Do not overwrite this script if you didnt know what youre doing ###
 #
 # New Update are now released, OpenVPN Server
 # are now running both TCP and UDP Protocol. (Both are only running on IPv4)
 # But our native server.conf are now removed and divided
 # Into two different configs base on their Protocols:
 #  * OpenVPN TCP (located at /etc/openvpn/server/server_tcp.conf
 #  * OpenVPN UDP (located at /etc/openvpn/server/server_udp.conf
 # 
 # Also other logging files like
 # status logs and server logs
 # are moved into new different file names:
 #  * OpenVPN TCP Server logs (/etc/openvpn/server/tcp.log)
 #  * OpenVPN UDP Server logs (/etc/openvpn/server/udp.log)
 #  * OpenVPN TCP Status logs (/etc/openvpn/server/tcp_stats.log)
 #  * OpenVPN UDP Status logs (/etc/openvpn/server/udp_stats.log)
 #
 # Since config file name changes, systemctl/service identifiers are changed too.
 # To restart TCP Server: systemctl restart openvpn-server@server_tcp
 # To restart UDP Server: systemctl restart openvpn-server@server_udp
 #
 # Server ports are configured base on env vars
 # executed/raised from this script (OpenVPN_TCP_Port/OpenVPN_UDP_Port)
 #
 # Enjoy the new update
 # Script Updated by Bonveio
NUovpn

wget -qO /etc/openvpn/b.zip 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/openvpn_plugin64'
unzip -qq /etc/openvpn/b.zip -d /etc/openvpn
rm -f /etc/openvpn/b.zip

ovpnPluginPam="$(find /usr -iname 'openvpn-*.so' | grep 'auth-pam' | head -n1)"
if [[ -z "$ovpnPluginPam" ]]; then
 sed -i "s|PLUGIN_AUTH_PAM|/etc/openvpn/openvpn-auth-pam.so|g" /etc/openvpn/server/*.conf
else
 sed -i "s|PLUGIN_AUTH_PAM|$ovpnPluginPam|g" /etc/openvpn/server/*.conf
fi

sed -i '/net.ipv4.ip_forward.*/d' /etc/sysctl.conf
sed -i '/#net.ipv4.ip_forward.*/d' /etc/sysctl.conf
sed -i '/net.ipv4.ip_forward.*/d' /etc/sysctl.d/*
sed -i '/#net.ipv4.ip_forward.*/d' /etc/sysctl.d/*
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/20-openvpn.conf
sysctl --system &> /dev/null

if [[ "$(hostnamectl | grep -i Virtualization | awk '{print $2}' | head -n1)" == 'openvz' ]]; then
 sed -i 's|LimitNPROC|#LimitNPROC|g' /lib/systemd/system/openvpn*
 systemctl daemon-reload
fi

sed -i 's|ExecStart=.*|ExecStart=/usr/sbin/openvpn --status %t/openvpn-server/status-%i.log --status-version 2 --suppress-timestamps --config %i.conf|g' /lib/systemd/system/openvpn-server\@.service
systemctl daemon-reload

echo -e "[\e[33mNotice\e[0m] Restarting OpenVPN Service.."
systemctl restart openvpn-server &> /dev/null
systemctl start openvpn-server@server_tcp &>/dev/null
systemctl start openvpn-server@server_udp &>/dev/null
systemctl enable openvpn-server@server_tcp &> /dev/null
systemctl enable openvpn-server@server_udp &> /dev/null

systemctl start openvpn-server@ec_server_tcp &> /dev/null
systemctl start openvpn-server@ec_server_udp &> /dev/null
systemctl enable openvpn-server@ec_server_tcp &> /dev/null
systemctl enable openvpn-server@ec_server_udp &> /dev/null
}

function ConfigMenu(){
echo -e "[\e[32mInfo\e[0m] Creating Menu scripts.."

cd /usr/local/sbin/
rm -rf {accounts,base-ports,base-ports-wc,base-script,bench-network,clearcache,connections,create,create_random,create_trial,delete_expired,diagnose,edit_dropbear,edit_openssh,edit_openvpn,edit_ports,edit_squi*,edit_stunne*,locked_list,menu,options,ram,reboot_sys,reboot_sys_auto,restart_services,screenfetch,server,set_multilogin_autokill,set_multilogin_autokill_lib,show_ports,speedtest,user_delete,user_details,user_details_lib,user_extend,user_list,user_lock,user_unlock,*_gtm_noload}
wget -q 'https://raw.githubusercontent.com/Bonveio/BonvScripts/master/menuV1.zip'
unzip -qq -o menuV1.zip
rm -f menuV1.zip
chmod +x ./*
dos2unix -q ./*
cd ~
}

function ConfigSyscript(){
echo -e "[\e[32mInfo\e[0m] Creating Startup scripts.."
if [[ ! -e /etc/bonveio ]]; then
 mkdir -p /etc/bonveio
fi
cat <<'EOFSH' > /etc/bonveio/startup.sh
#!/bin/bash
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
#
export DEBIAN_FRONTEND=noninteractive
#apt clean
screen -dmS delexpuser bash /usr/local/sbin/delete_expired &>/dev/null
screen -dmS socks python ~/.ws-socks.py &>/dev/null
screen -dmS socks2 python ~/.ws-ssl-socks.py &>/dev/null
EOFSH
chmod +x /etc/bonveio/startup.sh

echo 'clear' > /etc/profile.d/bonv.sh
echo 'screenfetch -p -A Debian | sed -r "/^\s*$/d" ' >> /etc/profile.d/bonv.sh
chmod +x /etc/profile.d/bonv.sh

echo "[Unit]
Description=Bonveio Startup Script
Before=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/bonveio/startup.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/bonveio.service
chmod +x /etc/systemd/system/bonveio.service
systemctl daemon-reload
systemctl start bonveio
systemctl enable bonveio &> /dev/null

#sed -i '/0\s*4\s*.*/d' /etc/cron.d/*
#sed -i '/0\s*4\s*.*/d' /etc/crontab
sed -i '/*.root\sreboot$/d' /etc/cron.d/*
sed -i '/*.root\sreboot$/d' /etc/crontab
echo -e "\r\n" >> /etc/crontab
echo -e "0 4\t* * *\troot\treboot" >> /etc/cron.d/reboot_sys
printf "%s" "0 */4  * * *  root  /usr/bin/screen -S delexpuser -dm bash -c '/usr/local/sbin/delete_expired'" > /etc/cron.d/autodelete_expireduser
systemctl restart cron
}

function ConfigNginxOvpn(){
echo -e "[\e[32mInfo\e[0m] Configuring Nginx configs.."

cat <<'EOFnginx' > /etc/nginx/conf.d/bonveio-ovpn-config.conf
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
#
server {
 listen 0.0.0.0:86;
 server_name localhost;
 root /var/www/openvpn;
 index index.html;
}
EOFnginx

rm -rf /etc/nginx/sites-*
rm -rf /usr/share/nginx/html
rm -rf /var/www/openvpn
mkdir -p /var/www/openvpn

echo -e "[\e[32mInfo\e[0m] Creating OpenVPN client configs.."

cat <<'mySiteOvpn' > /var/www/openvpn/index.html
<!DOCTYPE html>
<html lang="en">

<!-- Simple OVPN Download site by FirenetDev -->

<head><meta charset="utf-8" /><title>MyScriptName OVPN Config Download</title><meta name="description" content="MyScriptName Server" /><meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" /><meta name="theme-color" content="#000000" /><link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"><link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"><link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.3/css/mdb.min.css" rel="stylesheet"></head><body><div class="container justify-content-center" style="margin-top:9em;margin-bottom:5em;"><div class="col-md"><div class="view"><img src="https://openvpn.net/wp-content/uploads/openvpn.jpg" class="card-img-top mb-5" height="150"><div class="mask rgba-white-slight"></div></div><div class="card"><div class="card-body"><h5 class="card-title">Config List</h5><br /><ul class="list-group">

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> TCP Protocol</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/tcp.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP OHP <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> TCP Protocol via OHP</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/tcp_ohp.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP EC <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> TCP Protocol Elliptic Curve</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/tcp_ec.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>TCP OHP EC <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> TCP Protocol Elliptic Curve via OHP</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/tcp_ohp_ec.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>UDP <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> UDP Protocol</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/udp.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

<li class="list-group-item justify-content-between align-items-center" style="margin-bottom:1em;"><p>UDP EC <span class="badge light-blue darken-4">Android/iOS/PC/Modem</span><br /><small> UDP Protocol Elliptic Curve</small></p><a class="btn btn-outline-success waves-effect btn-sm" href="http://IP-ADDRESS:NGINXPORT/udp_ec.ovpn" style="float:right;"><i class="fa fa-download"></i> Download</a></li>

</ul></div></div></div></div></body></html>
mySiteOvpn

sed -i "s|MyScriptName|BonvScripts|g" /var/www/openvpn/index.html
sed -i "s|NGINXPORT|86|g" /var/www/openvpn/index.html
sed -i "s|IP-ADDRESS|$(ip_address)|g" /var/www/openvpn/index.html

######
cat <<"EOFtcp" > /var/www/openvpn/tcp.ovpn

# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
# 

client
dev tun
persist-tun
proto tcp
remote IP-ADDRESS 1194
http-proxy IP-ADDRESS 8000
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
http-proxy-option VERSION 1.1
http-proxy-option AGENT Chrome/80.0.3987.87
http-proxy-option CUSTOM-HEADER Host redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER X-Forward-Host redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER X-Forwarded-For redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER Referrer redirect.googlevideo.com
auth-user-pass
EOFtcp

cat <<"EOFohp1" > /var/www/openvpn/tcp_ohp.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
#
# Experimental Config only
# Examples demonstrated below on how to Play with OHPServer
#

client
dev tun
persist-tun
proto tcp

# We can play this one, put any host on the line
# remote anyhost.com anyport
# remote www.google.com.ph 443
#
# We can also play with CRLFs
#remote "HEAD https://ajax.googleapis.com HTTP/1.1/r/n/r/n"
# Every types of Broken remote line setups/crlfs/payload are accepted, just put them inside of double-quotes
remote "https://www.phcorner.net"
## use this line to modify OpenVPN remote port (this will serve as our fake ovpn port)
port 443

# This proxy uses as our main forwarder for OpenVPN tunnel.
http-proxy IP-ADDRESS 8087

# We can also play our request headers here, everything are accepted, put them inside of a double-quotes.
http-proxy-option VERSION 1.1
http-proxy-option CUSTOM-HEADER ""
http-proxy-option CUSTOM-HEADER "Host: www.firenetvpn.com%2F"
http-proxy-option CUSTOM-HEADER "X-Forwarded-Host: www.digicert.net%2F"
http-proxy-option CUSTOM-HEADER ""

persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
auth-user-pass
EOFohp1

cat <<"EOFudp" > /var/www/openvpn/udp.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
#
# Example UDP Client. 
#
client
dev tun
persist-tun
proto udp
remote IP-ADDRESS 25222
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
float
fast-io
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
auth-user-pass
EOFudp

cat <<"EOFec" > /var/www/openvpn/tcp_ec.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
# 

client
dev tun
persist-tun
proto tcp
remote IP-ADDRESS 25980
http-proxy IP-ADDRESS 8000
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
tls-client
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
http-proxy-option VERSION 1.1
http-proxy-option AGENT Chrome/80.0.3987.87
http-proxy-option CUSTOM-HEADER Host redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER X-Forward-Host redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER X-Forwarded-For redirect.googlevideo.com
http-proxy-option CUSTOM-HEADER Referrer redirect.googlevideo.com
auth-user-pass
EOFec

cat <<"EOFohpec" > /var/www/openvpn/tcp_ohp_ec.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
#
# Experimental Config only
# Examples demonstrated below on how to Play with OHPServer
#

client
dev tun
persist-tun
proto tcp

# We can play this one, put any host on the line
# remote anyhost.com anyport
# remote www.google.com.ph 443
#
# We can also play with CRLFs
#remote "HEAD https://ajax.googleapis.com HTTP/1.1/r/n/r/n"
# Every types of Broken remote line setups/crlfs/payload are accepted, just put them inside of double-quotes
remote "https://www.phcorner.net"
## use this line to modify OpenVPN remote port (this will serve as our fake ovpn port)
port 443

# This proxy uses as our main forwarder for OpenVPN tunnel.
http-proxy IP-ADDRESS 8088

# We can also play our request headers here, everything are accepted, put them inside of a double-quotes.
http-proxy-option VERSION 1.1
http-proxy-option CUSTOM-HEADER ""
http-proxy-option CUSTOM-HEADER "Host: www.firenetvpn.com%2F"
http-proxy-option CUSTOM-HEADER "X-Forwarded-Host: www.digicert.net%2F"
http-proxy-option CUSTOM-HEADER ""

persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
tls-client
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
auth-user-pass
EOFohpec

cat <<"EOFudpec" > /var/www/openvpn/udp_ec.ovpn
# OpenVPN Server build vOPENVPN_SERVER_VERSION
# Server Location: OPENVPN_SERVER_LOCATION
# Server ISP: OPENVPN_SERVER_ISP
#
# Example UDP Client. 
#
client
dev tun
persist-tun
proto udp
remote IP-ADDRESS 25985
persist-remote-ip
resolv-retry infinite
connect-retry 0 1
remote-cert-tls server
nobind
float
fast-io
reneg-sec 0
keysize 0
rcvbuf 0
sndbuf 0
verb 2
comp-lzo
auth none
auth-nocache
cipher none
setenv CLIENT_CERT 0
tls-client
tls-version-min 1.2
tls-cipher TLS-ECDHE-ECDSA-WITH-AES-128-GCM-SHA256
auth-user-pass
EOFudpec

sed -i "s|IP-ADDRESS|$(ip_address)|g" /var/www/openvpn/*.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ca.crt)\n</ca>" >> /var/www/openvpn/tcp.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ca.crt)\n</ca>" >> /var/www/openvpn/tcp_ohp.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ca.crt)\n</ca>" >> /var/www/openvpn/udp.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ec_ca.crt)\n</ca>" >> /var/www/openvpn/tcp_ec.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ec_ca.crt)\n</ca>" >> /var/www/openvpn/tcp_ohp_ec.ovpn

echo -e "<ca>\n$(cat /etc/openvpn/ec_ca.crt)\n</ca>" >> /var/www/openvpn/udp_ec.ovpn

sed -i "s|OPENVPN_SERVER_VERSION|$(openvpn --version | cut -d" " -f2 | head -n1)|g" /var/www/openvpn/*.ovpn
sed -i "s|OPENVPN_SERVER_LOCATION|$(curl -4s http://ipinfo.io/country), $(curl -4s http://ipinfo.io/region)|g" /var/www/openvpn/*.ovpn
sed -i "s|OPENVPN_SERVER_ISP|$(curl -4s http://ipinfo.io/org | sed -e 's/[^ ]* //')|g" /var/www/openvpn/*.ovpn

cd /var/www/openvpn
zip -r Configs.zip *.ovpn &> /dev/null
cd

echo -e "[\e[33mNotice\e[0m] Restarting Nginx Service.."
systemctl restart nginx
}

function InsProxy(){
 # Removing Duplicate privoxy config
 rm -rf /etc/privoxy/config*

 # Creating Privoxy server config using cat eof tricks
 cat <<'myPrivoxy' > /etc/privoxy/config
# My Privoxy Server Config
user-manual /usr/share/doc/privoxy/user-manual
confdir /etc/privoxy
logdir /var/log/privoxy
filterfile default.filter
logfile logfile
listen-address 0.0.0.0:Privoxy_Port1
listen-address 0.0.0.0:Privoxy_Port2
toggle 1
enable-remote-toggle 0
enable-remote-http-toggle 0
enable-edit-actions 0
enforce-blocks 0
buffer-limit 4096
enable-proxy-authentication-forwarding 1
forwarded-connect-retries 1
accept-intercepted-requests 1
allow-cgi-request-crunching 1
split-large-forms 0
keep-alive-timeout 5
tolerate-pipelining 1
socket-timeout 300
permit-access 0.0.0.0/0 IP-ADDRESS
myPrivoxy

 # Setting machine's IP Address inside of our privoxy config(security that only allows this machine to use this proxy server)
 sed -i "s|IP-ADDRESS|$IPADDR|g" /etc/privoxy/config

 # Setting privoxy ports
 sed -i "s|Privoxy_Port1|$Privoxy_Port1|g" /etc/privoxy/config
 sed -i "s|Privoxy_Port2|$Privoxy_Port2|g" /etc/privoxy/config

 # I'm setting Some Squid workarounds to prevent Privoxy's overflowing file descriptors that causing 50X error when clients trying to connect to your proxy server(thanks for this trick @homer_simpsons)
 apt remove --purge squid -y
 rm -rf /etc/squid/sq*
 apt install squid -y

# Squid Ports (must be 1024 or higher)

 cat <<mySquid > /etc/squid/squid.conf
acl VPN dst $(wget -4qO- http://ipinfo.io/ip)/32
http_access allow VPN
http_access deny all
http_port 0.0.0.0:$Proxy_Port1
http_port 0.0.0.0:$Proxy_Port2
coredump_dir /var/spool/squid
dns_nameservers 1.1.1.1 1.0.0.1
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0
refresh_pattern . 0 20% 4320
visible_hostname localhost
mySquid

 sed -i "s|SquidCacheHelper|$Proxy_Port1|g" /etc/squid/squid.conf
 sed -i "s|SquidCacheHelper|$Proxy_Port2|g" /etc/squid/squid.conf

 # Starting Proxy server
 echo -e "Restarting proxy server.."
 systemctl restart privoxy
 systemctl restart squid

echo -e "[\e[32mInfo\e[0m] Configuring OHPServer"
if [[ ! -e /etc/ohpserver ]]; then
 mkdir /etc/ohpserver
 else
 rm -rf /etc/ohpserver/*
fi
curl -4skL "https://github.com/lfasmpao/open-http-puncher/releases/download/0.1/ohpserver-linux32.zip" -o /etc/ohpserver/ohp.zip
unzip -qq /etc/ohpserver/ohp.zip -d /etc/ohpserver
rm -rf /etc/ohpserver/ohp.zip
chmod +x /etc/ohpserver/ohpserver

cat <<'Ohp1' > /etc/ohpserver/run
#!/bin/bash
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
# OHPServer startup script
/etc/ohpserver/ohpserver -port 8085 -proxy 127.0.0.1:25800 -tunnel 127.0.0.1:701 > /etc/ohpserver/dropbear.log &
/etc/ohpserver/ohpserver -port 8086 -proxy 127.0.0.1:25800 -tunnel 127.0.0.1:225 > /etc/ohpserver/openssh.log &
/etc/ohpserver/ohpserver -port 8087 -proxy 127.0.0.1:25800 -tunnel 127.0.0.1:179 > /etc/ohpserver/openvpn.log &
/etc/ohpserver/ohpserver -port 8088 -proxy 127.0.0.1:25800 -tunnel 127.0.0.1:25980 > /etc/ohpserver/openvpn.log
Ohp1
chmod +x /etc/ohpserver/run

cat <<'Ohp2' > /etc/ohpserver/stop
#!/bin/bash
# BonvScripts
# https://t.me/BonvScripts
# Please star my Repository: https://github.com/Bonveio/BonvScripts
# https://phcorner.net/threads/739298
# OHPServer stop script
lsof -t -i tcp:8085 -s tcp:listen | xargs kill 2>/dev/null ### Dropbear
lsof -t -i tcp:8086 -s tcp:listen | xargs kill 2>/dev/null ### OpenSSH
lsof -t -i tcp:8087 -s tcp:listen | xargs kill 2>/dev/null ### OpenVPN TCP RSA
lsof -t -i tcp:8088 -s tcp:listen | xargs kill 2>/dev/null ### OpenVPN TCP EC
Ohp2
chmod +x /etc/ohpserver/stop

cat <<'EOFohp' > /lib/systemd/system/ohpserver.service
[Unit]
Description=OpenHTTP Puncher Server
Wants=network.target
After=network.target

[Service]
ExecStart=/bin/bash /etc/ohpserver/run 2>/dev/null
ExecStop=/bin/bash /etc/ohpserver/stop 2>/dev/null
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOFohp
systemctl daemon-reload &>/dev/null
systemctl restart ohpserver.service &>/dev/null
systemctl enable ohpserver.service &>/dev/null
}


function ScriptMessage(){
 echo -e ""
 echo -e " (｡◕‿◕｡) $MyScriptName VPS Installer"
 echo -e " Script created by Bonveio"
 echo -e " Remoded by XAM"
 echo -e ""
}

function service() {
cat << PTHON > /usr/sbin/yakult
#!/usr/bin/python
import socket, threading, thread, select, signal, sys, time, getopt

# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 80

# Pass
PASS = ''

# CONST
BUFLEN = 4096 * 4
TIMEOUT = 3600
DEFAULT_HOST = '127.0.0.1:900'
RESPONSE = 'HTTP/1.1 101 <font color="purple">xamjyssvpn.com|coronassh.com</font>\r\n\r\nContent-Length: 104857600000\r\n\r\n'

class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()

    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True

        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue

                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()

    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()

    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()

    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()

    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()

            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()


class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)

    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True

        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True

    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)

            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')

            if hostPort == '':
                hostPort = DEFAULT_HOST

            split = self.findHeader(self.client_buffer, 'X-Split')

            if split != '':
                self.client.recv(BUFLEN)

            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')

        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)

    def findHeader(self, head, header):
        aux = head.find(header + ': ')

        if aux == -1:
            return ''

        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')

        if aux == -1:
            return ''

        return head[:aux];

    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 443
            else:
                port = sys.argv[1]

        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]

        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)

    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path

        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''

        self.server.printLog(self.log)
        self.doCONNECT()

    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]

                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break


def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'

def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)


def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    print "\n:-------PythonProxy-------:\n"
    print "Listening addr: " + LISTENING_ADDR
    print "Listening port: " + str(LISTENING_PORT) + "\n"
    print ":-------------------------:\n"
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()
    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Stopping...'
            server.close()
            break

#######    parse_args(sys.argv[1:])
if __name__ == '__main__':
    main()

PTHON
}


function service1() {

cat << END > /lib/systemd/system/yakult.service
[Unit]
Description=Yakult
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
NoNewPrivileges=true
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/python -O /usr/sbin/yakult
ProtectSystem=true
ProtectHome=true
RemainAfterExit=yes
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

}

function gatorade() {
cat << PTHON > /usr/sbin/gatorade
#!/usr/bin/python
import socket, threading, thread, select, signal, sys, time, getopt

# Listen
LISTENING_ADDR = '0.0.0.0'
if sys.argv[1:]:
  LISTENING_PORT = sys.argv[1]
else:
  LISTENING_PORT = 8880

# Pass
PASS = ''

# CONST
BUFLEN = 4096 * 4
TIMEOUT = 3600
DEFAULT_HOST = '127.0.0.1:1194'
RESPONSE = 'HTTP/1.1 101 <font color="red">xamjyssvpn.com|coronassh.com</font>\r\n\r\nContent-Length: 104857600000\r\n\r\n'

class Server(threading.Thread):
    def __init__(self, host, port):
        threading.Thread.__init__(self)
        self.running = False
        self.host = host
        self.port = port
        self.threads = []
        self.threadsLock = threading.Lock()
        self.logLock = threading.Lock()

    def run(self):
        self.soc = socket.socket(socket.AF_INET)
        self.soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.soc.settimeout(2)
        intport = int(self.port)
        self.soc.bind((self.host, intport))
        self.soc.listen(0)
        self.running = True

        try:
            while self.running:
                try:
                    c, addr = self.soc.accept()
                    c.setblocking(1)
                except socket.timeout:
                    continue

                conn = ConnectionHandler(c, self, addr)
                conn.start()
                self.addConn(conn)
        finally:
            self.running = False
            self.soc.close()

    def printLog(self, log):
        self.logLock.acquire()
        print log
        self.logLock.release()

    def addConn(self, conn):
        try:
            self.threadsLock.acquire()
            if self.running:
                self.threads.append(conn)
        finally:
            self.threadsLock.release()

    def removeConn(self, conn):
        try:
            self.threadsLock.acquire()
            self.threads.remove(conn)
        finally:
            self.threadsLock.release()

    def close(self):
        try:
            self.running = False
            self.threadsLock.acquire()

            threads = list(self.threads)
            for c in threads:
                c.close()
        finally:
            self.threadsLock.release()


class ConnectionHandler(threading.Thread):
    def __init__(self, socClient, server, addr):
        threading.Thread.__init__(self)
        self.clientClosed = False
        self.targetClosed = True
        self.client = socClient
        self.client_buffer = ''
        self.server = server
        self.log = 'Connection: ' + str(addr)

    def close(self):
        try:
            if not self.clientClosed:
                self.client.shutdown(socket.SHUT_RDWR)
                self.client.close()
        except:
            pass
        finally:
            self.clientClosed = True

        try:
            if not self.targetClosed:
                self.target.shutdown(socket.SHUT_RDWR)
                self.target.close()
        except:
            pass
        finally:
            self.targetClosed = True

    def run(self):
        try:
            self.client_buffer = self.client.recv(BUFLEN)

            hostPort = self.findHeader(self.client_buffer, 'X-Real-Host')

            if hostPort == '':
                hostPort = DEFAULT_HOST

            split = self.findHeader(self.client_buffer, 'X-Split')

            if split != '':
                self.client.recv(BUFLEN)

            if hostPort != '':
                passwd = self.findHeader(self.client_buffer, 'X-Pass')
				
                if len(PASS) != 0 and passwd == PASS:
                    self.method_CONNECT(hostPort)
                elif len(PASS) != 0 and passwd != PASS:
                    self.client.send('HTTP/1.1 400 WrongPass!\r\n\r\n')
                elif hostPort.startswith('127.0.0.1') or hostPort.startswith('localhost'):
                    self.method_CONNECT(hostPort)
                else:
                    self.client.send('HTTP/1.1 403 Forbidden!\r\n\r\n')
            else:
                print '- No X-Real-Host!'
                self.client.send('HTTP/1.1 400 NoXRealHost!\r\n\r\n')

        except Exception as e:
            self.log += ' - error: ' + e.strerror
            self.server.printLog(self.log)
	    pass
        finally:
            self.close()
            self.server.removeConn(self)

    def findHeader(self, head, header):
        aux = head.find(header + ': ')

        if aux == -1:
            return ''

        aux = head.find(':', aux)
        head = head[aux+2:]
        aux = head.find('\r\n')

        if aux == -1:
            return ''

        return head[:aux];

    def connect_target(self, host):
        i = host.find(':')
        if i != -1:
            port = int(host[i+1:])
            host = host[:i]
        else:
            if self.method=='CONNECT':
                port = 443
            else:
                port = sys.argv[1]

        (soc_family, soc_type, proto, _, address) = socket.getaddrinfo(host, port)[0]

        self.target = socket.socket(soc_family, soc_type, proto)
        self.targetClosed = False
        self.target.connect(address)

    def method_CONNECT(self, path):
        self.log += ' - CONNECT ' + path

        self.connect_target(path)
        self.client.sendall(RESPONSE)
        self.client_buffer = ''

        self.server.printLog(self.log)
        self.doCONNECT()

    def doCONNECT(self):
        socs = [self.client, self.target]
        count = 0
        error = False
        while True:
            count += 1
            (recv, _, err) = select.select(socs, [], socs, 3)
            if err:
                error = True
            if recv:
                for in_ in recv:
		    try:
                        data = in_.recv(BUFLEN)
                        if data:
			    if in_ is self.target:
				self.client.send(data)
                            else:
                                while data:
                                    byte = self.target.send(data)
                                    data = data[byte:]

                            count = 0
			else:
			    break
		    except:
                        error = True
                        break
            if count == TIMEOUT:
                error = True
            if error:
                break


def print_usage():
    print 'Usage: proxy.py -p <port>'
    print '       proxy.py -b <bindAddr> -p <port>'
    print '       proxy.py -b 0.0.0.0 -p 80'

def parse_args(argv):
    global LISTENING_ADDR
    global LISTENING_PORT
    
    try:
        opts, args = getopt.getopt(argv,"hb:p:",["bind=","port="])
    except getopt.GetoptError:
        print_usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print_usage()
            sys.exit()
        elif opt in ("-b", "--bind"):
            LISTENING_ADDR = arg
        elif opt in ("-p", "--port"):
            LISTENING_PORT = int(arg)


def main(host=LISTENING_ADDR, port=LISTENING_PORT):
    print "\n:-------PythonProxy-------:\n"
    print "Listening addr: " + LISTENING_ADDR
    print "Listening port: " + str(LISTENING_PORT) + "\n"
    print ":-------------------------:\n"
    server = Server(LISTENING_ADDR, LISTENING_PORT)
    server.start()
    while True:
        try:
            time.sleep(2)
        except KeyboardInterrupt:
            print 'Stopping...'
            server.close()
            break

#######    parse_args(sys.argv[1:])
if __name__ == '__main__':
    main()

PTHON
}


function gatorade1() {

cat << END > /lib/systemd/system/gatorade.service
[Unit]
Description=Gatorade
Documentation=https://google.com
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
NoNewPrivileges=true
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
ExecStart=/usr/bin/python -O /usr/sbin/gatorade
ProtectSystem=true
ProtectHome=true
RemainAfterExit=yes
Restart=on-failure
[Install]
WantedBy=multi-user.target
END

}
function BBR() {
wget -q "https://github.com/yue0706/auto_bbr/raw/main/bbr.sh" && chmod +x bbr.sh && ./bbr.sh
sed -i '/^\*\ *soft\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
sed -i '/^\*\ *hard\ *nofile\ *[[:digit:]]*/d' /etc/security/limits.conf
echo '* soft nofile 65536' >>/etc/security/limits.conf
echo '* hard nofile 65536' >>/etc/security/limits.conf
echo '' > /root/.bash_history && history -c && echo '' > /var/log/syslog

F1='/etc/modules-load.d/modules.conf' && { [[ $(grep -cE '^tcp_bbr$' $F1) -ge 1 ]] && echo "bbr already added" || echo "tcp_bbr" >> "$F1"; } && modprobe tcp_bbr
F2='net.core.default_qdisc' && F3='net.ipv4.tcp_congestion_control' && sed -i "/^$F2.*/d;/^$F3.*/d" /etc/sysctl{.conf,.d/*.conf} && echo -e "${F2}=fq\n${F3}=bbr" >> /etc/sysctl.d/98-bbr.conf && sysctl --system &>/dev/null

}

function setting() {
service ssh restart
service sshd restart
service dropbear restart
systemctl daemon-reload
systemctl enable yakult
systemctl restart yakult
systemctl daemon-reload
systemctl enable gatorade
systemctl restart gatorade
}
function slowdns() {
apt update; apt upgrade -y; rm -rf install; wget https://raw.githubusercontent.com/xamjyss143/slow-dns/main/install; chmod +x install; ./install
bash /etc/slowdns/slowdns-ssh
startdns

}
function remove() {
echo ' ' > .bash_history
history -c
echo ' ' > /var/log/syslog
rm -f *
}




#############################
#############################
## Installation Process
#############################
## WARNING: Do not modify or edit anything
## if you did'nt know what to do.
## This part is too sensitive.
#############################
#############################


 # (For OpenVPN) Checking it this machine have TUN Module, this is the tunneling interface of OpenVPN server
 if [[ ! -e /dev/net/tun ]]; then
 echo -e "[\e[1;31m×\e[0m] You cant use this script without TUN Module installed/embedded in your machine, file a support ticket to your machine admin about this matter"
 echo -e "[\e[1;31m-\e[0m] Script is now exiting..."
 exit 1
fi

 # Begin Installation by Updating and Upgrading machine and then Installing all our wanted packages/services to be install.
 ScriptMessage
 sleep 2

  echo -e "\033[0;35mUpdating Libraries....\033[0m"
 Instupdate

 # Configure OpenSSH and Dropbear
 echo -e "\033[0;35mConfiguring ssh...\033[0m"
 InstSSH

 # Configure Stunnel
 echo -e "\033[0;35mConfiguring stunnel...\033[0m"
 InsStunnel

 # Configure Privoxy and Squid
 echo -e "\033[0;35mConfiguring proxy...\033[0m"
 InsProxy

 # Configure OpenVPN
 echo -e "\033[0;35mConfiguring OpenVPN...\033[0m"
 ConfigOpenVPN

 # Configuring Nginx OVPN config download site
 ConfigNginxOvpn

 # Some assistance and startup scripts
 ConfigSyscript

 # VPS Menu script v1.0
 ConfigMenu

 echo -e "\033[0;35m Installing BBR...\033[0m"
 service
 service1
 gatorade
 gatorade1
 BBR
 slowdns
setting
remove

echo -e "[\e[32mInfo\e[0m] Finalizing installation process.."
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime
sed -i '/\/bin\/false/d' /etc/shells
sed -i '/\/usr\/sbin\/nologin/d' /etc/shells
echo '/bin/false' >> /etc/shells
echo '/usr/sbin/nologin' >> /etc/shells
sleep 1
######

clear
clear
clear
bash /etc/profile.d/bonv.sh

 # Showing script's banner message
 ScriptMessage

 # Showing additional information from installating this script
 


 echo -e " Success Installation"
 echo -e ""
 echo -e " Service Ports: "
 echo -e " OpenSSH: $SSH_Port1, $SSH_Port2"
 echo -e " Stunnel: $Stunnel_Port1, $Stunnel_Port2"
 echo -e " DropbearSSH: $Dropbear_Port1, $Dropbear_Port2"
 echo -e " Privoxy: $Privoxy_Port1, $Privoxy_Port2"
 echo -e " Squid: $Proxy_Port1, $Proxy_Port2"
 echo -e " OpenVPN: $OpenVPN_Port1, $OpenVPN_Port2, $OpenVPN_Port3, $OpenVPN_Port4"
 echo -e " NGiNX: $OvpnDownload_Port"
 echo -e " DNS: $MYDNS"
 echo -ne "\033[1;33mYOUR KEY:\033[0m " && cat /root/server.pub
 echo -ne "\033[1;33mYOUR NAMESERVER:\033[0m " && cat nameserver.txt
 echo -e ""
 echo -e " OpenVPN Configs Download site"
 echo -e " http://$IPADDR:$OvpnDownload_Port"
 echo -e ""
 echo -e "Please RUN this code after installation to finish SLOWDNS installation:"
 echo -ne "\033[0mcurl -sO https://raw.githubusercontent.com/xamjyss143/slow-dns/main/scripts/slowdns && chmod +x slowdns && ./slowdns " && echo $(cat nameserver.txt /root/server.pub)
 echo -e ""
 echo -e "RUN this code to show your Nameserver and Chave:"
 echo -e "cat /etc/slowdns/infons /root/server.pub"
 echo -e ""
 echo -e " [Note] DO NOT RESELL THIS SCRIPT"

 # Clearing all logs from installation
 rm -rf /root/.bash_history && history -c && echo '' > /var/log/syslog
