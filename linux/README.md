# Instalador de Zabbix Agent para Ubuntu Server 24.04

Este repositorio contiene un script interactivo que instala y configura automáticamente el **Zabbix Agent 7.2** en servidores Ubuntu 24.04.

---

## ✅ Requisitos

- Ubuntu Server 24.04
- Acceso root o `sudo`
- Conexión a Internet
- `wget` y `dpkg` instalados (ya vienen por defecto)

---

## 🚀 Instrucciones de uso

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/raulmillicay/agente.git
   cd /agente/linux
   chmod +x install_zabbix_agent.sh
   sudo ./install_zabbix_agent.sh

2. **Aternativa para la ejecución**
   ```bash
   git clone https://github.com/raulmillicay/agente.git
   cd /agente/linux
   sudo bash install_zabbix_agent.sh
