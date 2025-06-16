#!/bin/bash

# Pedir IP del servidor Zabbix
read -p "Ingrese la IP del servidor Zabbix: " ZABBIX_SERVER_IP

# Pedir nombre de Hostname
read -p "Ingrese el nombre del Hostname para este agente: " ZABBIX_HOSTNAME

# Descargar e instalar el repositorio de Zabbix
wget https://repo.zabbix.com/zabbix/7.2/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.2+ubuntu24.04_all.deb
dpkg -i zabbix-release_latest_7.2+ubuntu24.04_all.deb

# Actualizar repositorios e instalar zabbix-agent
apt update
apt install -y zabbix-agent

# Modificar configuración con IP y Hostname ingresados
sed -i "s/^Server=.*/Server=${ZABBIX_SERVER_IP}/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^ServerActive=.*/ServerActive=${ZABBIX_SERVER_IP}/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^Hostname=.*/Hostname=${ZABBIX_HOSTNAME}/" /etc/zabbix/zabbix_agentd.conf

# Reiniciar y habilitar el servicio
systemctl restart zabbix-agent
systemctl enable zabbix-agent

# Mostrar estado
systemctl status zabbix-agent
