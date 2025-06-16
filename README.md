# Instalador de Zabbix Agent (Linux y Windows)

Este repositorio contiene scripts de instalación automática del **Zabbix Agent 7.2** para los siguientes sistemas operativos:

- ✅ Ubuntu Server 24.04 (Linux)
- ✅ Windows 10/11 y Windows Server (64 bits)

---

## 📂 Contenido

- [`/linux`](./linux): Script en Bash para instalar Zabbix Agent en Ubuntu Server 24.04.
- [`/windows`](./windows): Script en PowerShell para instalar Zabbix Agent en Windows 64 bits.

Cada carpeta contiene su propio `README.md` con instrucciones paso a paso.

---

## 🚀 Instrucciones rápidas

### Linux

```bash
git clone https://github.com/tuusuario/zabbix-agent-installer.git
cd zabbix-agent-installer/linux
chmod +x install_zabbix_agent.sh
sudo ./install_zabbix_agent.sh
