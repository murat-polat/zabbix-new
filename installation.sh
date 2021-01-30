wget https://repo.zabbix.com/zabbix/5.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.2-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_5.2-1+ubuntu20.04_all.deb
apt update


###   Install Zabbix server, frontend, agent

apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent


### Create initial database

sudo apt install mysql-server

mysql -uroot -p
password

# mysql> create database zabbix character set utf8 collate utf8_bin;
# mysql> create user zabbix@localhost identified by 'password';
# mysql> grant all privileges on zabbix.* to zabbix@localhost;
# mysql> quit;

## On Zabbix server host import initial schema and data. You will be prompted to enter your newly created password.

zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix

d. Configure the database for Zabbix server
Edit file /etc/zabbix/zabbix_server.conf

DBPassword=password
e. Start Zabbix server and agent processes
Start Zabbix server and agent processes and make it start at system boot.

systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2


f. Configure Zabbix frontend
Connect to your newly installed Zabbix frontend: http://server_ip_or_name/zabbix
Follow steps described in Zabbix documentation: Installing frontend

Start using Zabbix