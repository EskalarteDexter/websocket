#!/bin/bash

MyScriptName='Mediatek Panel'

# My VPS IP
MYIP=$(wget -qO- ipv4.icanhazip.com);

# Default Password
#DatabasePass='JohnFordTV'

# Default Database
#DatabaseName='YELLOWpanel'

# Server local time
MyVPS_Time='Asia/Manila'

function InstAsk(){
 clear
 echo ""
 echo "I need to ask some questions before starting setup"
 echo "You can leave the default option and just hit enter if you agree with the option"
 echo ""
 echo "First I need to know the new password of MySQL root user:"
 read -p "Password: " -e -i F1005r90@ DatabasePass
 echo ""
 echo "Name the Database Name for YELLOW Panel"
 echo " Please, use one word only, no special characters other than Underscore (_)"
 read -p " Database Name: " -e -i dexter DatabaseName
  echo ""
 echo "You need to have a domain pointed in your server IP for before install"
 read -p " Domain: " -e -i mediatek-vpn.com ydomain
 echo ""
 echo "Okay, that's all I need. We are ready to setup your YELLOW Panel now"
 read -n1 -r -p "Press any key to continue..."
}

function InstUpdates(){
 export DEBIAN_FRONTEND=noninteractive
 apt-get update
 apt-get upgrade -y
 
 # Removing some firewall tools that may affect other services
 apt-get remove --purge ufw firewalld -y
 
 # Installing some important machine essentials
 apt-get install nano git wget curl zip unzip tar gzip p7zip-full bc rc openssl cron build-essential expect net-tools screen bzip2 ccrypt lsof -y
 
 # Installing apt-transport-https and needed files
 apt-get install apt-transport-https lsb-release libdbi-perl libecap3 -y
 
 # Installing apache
 apt-get install apache2 -y
 
 # Installing fail2ban
 apt-get install fail2ban -y

 # Trying to remove obsolette packages after installation
 apt-get autoremove -y
 
 # Installing sury repo by pulling its repository inside sources.list file 
 wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
 sleep 2
 echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
 apt-get update
 
 # Installing php 5.6
 apt-get install php5.6 php5.6-fpm php5.6-mcrypt php5.6-sqlite3 php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-xml php5.6-zip php5.6-xmlrpc libapache2-mod-php5.6 -y

}

function InstMysql(){
 # Installing mysql server
 apt-get install mysql-server -y
 
 
 # Set Database Permissions
 chown -R mysql:mysql /var/lib/mysql/
 chmod -R 755 /var/lib/mysql/
 
 # mysql_secure_installation
 so1=$(expect -c "
spawn mysql_secure_installation; sleep 3
expect \"\";  sleep 3; send \"\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"n\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect \"\";  sleep 3; send \"Y\r\"
expect eof; ")
echo "$so1"

 #\r
 #Y
 #password
 #password
 #Y
 #n
 #Y
 #Y
 
 # Grant privileges on database to root
so2=$(expect -c "
spawn mysql -u root -p; sleep 3
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"CREATE DATABASE IF NOT EXISTS $DatabaseName;\r\"
expect \"\";  sleep 3; send \"GRANT ALL PRIVILEGES ON $DatabaseName.* TO 'root'@'localhost';\r\"
expect \"\";  sleep 3; send \"FLUSH PRIVILEGES;\r\"
expect \"\";  sleep 3; send \"EXIT;\r\"
expect eof; ")
echo "$so2"

 # Use MySQL Plugin
 so3=$(expect -c "
spawn mysql -u root -p; sleep 3
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"use mysql;\r\"
expect \"\";  sleep 3; send \"update user set plugin='' where User='root';\r\"
expect \"\";  sleep 3; send \"flush privileges;\r\"
expect \"\";  sleep 3; send \"EXIT;\r\"
expect eof; ")
echo "$so3"	

 # Set Remote root Login
  so4=$(expect -c "
spawn mysql -u root -p; sleep 3
expect \"\";  sleep 3; send \"$DatabasePass\r\"
expect \"\";  sleep 3; send \"CREATE USER root@'%' IDENTIFIED BY '$DatabasePass';\r\"
expect \"\";  sleep 3; send \"GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;\r\"
expect \"\";  sleep 3; send \"FLUSH PRIVILEGES;\r\"
expect \"\";  sleep 3; send \"EXIT;\r\"
expect eof; ")
echo "$so4"
}

function InstApache(){
 
 # Add servername on apache conf
 echo "ServerName localhost" >> /etc/apache2/apache2.conf
 
 # modify apache configs
 rm -f /etc/apache2/sites-enabled/000-default.conf
 wget -O /etc/apache2/sites-enabled/johnfordtv.conf "https://raw.githubusercontent.com/johndesu090/johnfordtv/master/johnfordtvhttpd.conf"
 sed -i "s|yourserver|localhost|g" /etc/apache2/sites-enabled/johnfordtv.conf 
 
 # Modifying apache modules
 a2dismod mpm_event
 a2enmod php5.6
 a2enmod rewrite
 a2enmod proxy_fcgi setenvif
 a2enconf php5.6-fpm
 ln -sf /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load
 systemctl restart apache2
 
 # Add Localhost Domain to Hosts
 echo "127.0.0.1  localhost" >> /etc/hosts
 
 # Setup dir and permissions
 useradd -m panel
 mkdir -p /home/panel/html
 echo "<?php phpinfo() ?>" > /home/panel/html/info.php
 chown -R www-data:www-data /home/panel/html
 chmod -R g+rw /home/panel/html
 #chcon -R -t httpd_sys_rw_content_t /home/panel/html
 
 # Then restart to take effect
 service php5.6-fpm restart
 service apache2 restart
}

function InstPanel(){
 
 # Pull YELLOW Source Code
 wget -O /home/panel/html/ypanel.zip https://www.dropbox.com/s/byw3wj2valszy6s/firenet.zip?dl=0
 sleep 2
 
 # Change dir to Webroot
 cd /home/panel/html
 
 # Deflate panel
 unzip ypanel.zip
 rm -f ypanel.zip
 
 # Set permissions
 chown -R www-data:www-data /home/panel/html
 chmod -R g+rw /home/panel/html
 
 # Install XML Parser Perl
 apt-get install libxml-parser-perl -y -f
}

function InstImpSql(){
 # Pull Fixed SQL
 wget -O /home/panel/html/ypanel.sql https://www.dropbox.com/s/okzrsvf0w3auyeo/debianfinal.sql
 # Import SQL to Database
 mysql -u root -p$DatabasePass $DatabaseName < /home/panel/html/ypanel.sql
 sleep 2
 
 # Change Database /home/panel/html crentials on .env
 sed -i "s|DatabasePass|$DatabasePass|g" /home/panel/html/includes/db_config.php
 sed -i "s|DatabaseName|$DatabaseName|g" /home/panel/html/includes/db_config.php
 
 # Change Database /home/panel/html crentials on ssh cron
 sed -i "s|JohnFordTV|$DatabasePass|g" /home/panel/html/cron_ssl_.php
 sed -i "s|yellowpanel|$DatabaseName|g" /home/panel/html/cron_ssl_.php
 #sed -i "s|IPADDRESS|$MYIP|g" /home/panel/html/cron_ssl_.php
 
 # Bind Mysql address to 0.0.0.0
 sleep 5 
echo -e "[mysql]" >> /etc/mysql/my.cnf
 echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf
 service mysql restart
}

function InstPassword(){
read -p "Enter Script Password: " -e -i mediatek pwdo
if test $pwdo == "mediatek"; then
echo "Password Accepted!"
else
echo "Password Incorrect!"
sleep 2
rm panelinstall.sh
exit
fi
}

function InstAntiD(){
 # Install Apache2 Anti DDOS and Bruteforce
 apt-get install libapache2-mod-evasive -y
 # Remove duplicate evasive config
 sleep 2
 rm -f /etc/apache2/mods-enabled/evasive.conf
 # Create new evasive configs
cat << EOF > /etc/apache2/mods-enabled/evasive.conf
    <IfModule mod_evasive20.c> 
         DOSHashTableSize 3097 
         DOSPageCount 2 
         DOSSiteCount 50 
         DOSPageInterval 1 
         DOSSiteInterval 1 
         DOSBlockingPeriod 10 
         DOSEmailNotify exodia090@gmail.com
         #DOSSystemCommand "su - someuser -c '/sbin/... %s ...'" 
         DOSLogDir "/var/log/mod_evasive" 
     </IfModule>
EOF
 # Create evasive log directory
 mkdir /var/log/mod_evasive 
 chown -R www-data:www-data /var/log/mod_evasive
 # Set hostame to your domain
 hostnamectl set-hostname $ydomain
 # Restart apache2 service
 systemctl restart apache2
 # Make fail2ban reject malicious requests on apache server
cat << EOF > /etc/fail2ban/jail.d/johnfordtvjail.conf
[apache]
enabled  = true
port     = http,https
filter   = apache-auth
logpath  = /var/log/apache2/*error.log
maxretry = 3
findtime = 600
ignoreip = 192.168.1.227
 
[apache-noscript]
enabled  = true
port     = http,https
filter   = apache-noscript
logpath  = /var/log/apache2/*error.log
maxretry = 3
findtime = 600
ignoreip = 192.168.1.227
 
[apache-overflows]
enabled  = true
port     = http,https
filter   = apache-overflows
logpath  = /var/log/apache2/*error.log
maxretry = 2
findtime = 600
ignoreip = 192.168.1.227
 
[apache-badbots]
enabled  = true
port     = http,https
filter   = apache-badbots
logpath  = /var/log/apache2/*error.log
maxretry = 2
findtime = 600
ignoreip = 192.168.1.227
EOF
 # Restart fail2ban service
 service fail2ban restart
}

function InstHistory(){
 # Clear Machine History
 cd
 rm -f /root/.bash_history && history -c
 echo "unset HISTFILE" >> /etc/profile
}

function ScriptMessage(){
 echo -e " [\e[1;32m$MyScriptName VPS Installer\e[0m]"
 echo -e ""
 echo -e "[GCASH] 092062008401 [PAYPAL] romanherbert94****@gmail.com"
 echo -e ""
}

function SetBanner(){
 # Install BashRC Banner
 echo "clear"                                                              >> .bashrc
 echo 'echo -e "\e[0m                                                   "' >> .bashrc
 echo 'echo -e "\e[94m    ::::::::::  ::::::::  :::::::::   ::::::::    "' >> .bashrc
 echo 'echo -e "\e[94m    :+:        :+:    :+: :+:    :+:  :+:   :+:   "' >> .bashrc
 echo 'echo -e "\e[94m    +:+        +:+    +:+ +:+    +:+  +:+   +:+   "' >> .bashrc
 echo 'echo -e "\e[94m    +#+#+#+#:  +#+    +#: +#+ #+#++:  +#+   +:+   "' >> .bashrc
 echo 'echo -e "\e[94m    +#+        +#+    +#+ +#+    +#+  +#+   +#+   "' >> .bashrc
 echo 'echo -e "\e[94m    #+#        #+#    #+# #+#    #+#  #+#   #+#   "' >> .bashrc
 echo 'echo -e "\e[94m    ###         ########  ###    ###  ########    "' >> .bashrc
 echo 'echo -e "\e[91m               Script by  JohnFordTV              "' >> .bashrc
 echo 'echo -e "\e[0m"'                                                    >> .bashrc
 echo 'echo -e "\e[92m             [YELLOWPANEL PREMIUM SCRIPT]         "' >> .bashrc
 echo 'echo -e "\e[0m                  fb.com/johndesu090               "' >> .bashrc
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

 # Now check if our machine is in root user, if not, this script exits
 # If you're on sudo user, run `sudo su -` first before running this script
 if [[ $EUID -ne 0 ]];then
 ScriptMessage
 echo -e "[\e[1;31mError\e[0m] This script must be run as root, exiting..."
 exit 1
fi

 # Begin Installation by Updating and Upgrading machine and then Installing all our wanted packages/services to be install.
 ScriptMessage
 InstPassword
 sleep 2
 sleep 2
 InstAsk
 
 # Update and Install Needed Files
 InstUpdates
 echo -e "Updating Server..."
 
 # Configure Mysql
 echo -e "Configuring MySQL..."
 InstMysql
 
 # Configure Apache
 echo -e "Configuring Apache Webserver..."
 InstApache
 
 # Configure YELLOW
 echo -e "Configuring YELLOW Panel Files..."
 InstPanel
 
 # Configure Anti DDoS
 echo -e "Setting Anti-DDoS evasive and fail2ban"
 sleep 2
 InstAntiD
 
 # Configure Database
 echo -e "Configuring Database..."
 InstImpSql
 
 # Clear history
 echo -e "Finalizing Installation..."
 InstHistory
 sleep 5
 
#CRONJOB DE PANEL
echo '*/5 * * * * root cd /home/panel/html/includes/cronjob && php /home/panel/html/includes/cronjob/cronjob_durations_task.php' >> /etc/crontab
echo '*/5 * * * * root cd /home/panel/html/includes/cronjob && php /home/panel/html/includes/cronjob/cronjob_servers.php' >> /etc/crontab
echo '*/10 * * * * root cd /home/panel/html/includes/cronjob && php /home/panel/html/includes/cronjob/cronjob_backup.php' >> /etc/crontab
/etc/init.d/cron reload > /dev/null 2>&1
/etc/init.d/cron restart > /dev/null 2>&1

 # Setting server local time
 ln -fs /usr/share/zoneinfo/$MyVPS_Time /etc/localtime

 # Some assistance and startup scripts
 ScriptMessage
 sleep 3
 cd

# info
clear
echo "=======================================================" | tee -a log-install.txt
echo "YELLOWPanel is installed at http://$MYIP !!!" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "YELLOW Script Installer by JohnFordTV"  | tee -a log-install.txt
echo "        (http://fb.com/johndesu090)         "  | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "+Login Details+" | tee -a log-install.txt
echo "Username: superadmin" | tee -a log-install.txt
echo "Password: superadmin" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "[DONATION] GCash: 09206200840 Paypal: johnford090@gmail.com " | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "[HTTPS] Install SSL Certificate on your site. COMMANDS BELOW. " | tee -a log-install.txt
echo "########################################################" | tee -a log-install.txt
echo "apt-get install certbot python-certbot-apache" | tee -a log-install.txt
echo "certbot --apache" | tee -a log-install.txt
echo "########################################################" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Installation Log --> /root/log-install.txt" | tee -a log-install.txt
echo "=======================================================" | tee -a log-install.txt
cd ~/

rm -f panelinstall.sh
linstall.sh
