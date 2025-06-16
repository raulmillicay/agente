# Pedir datos al usuario
$zabbixServerIP = Read-Host "Ingrese la IP del servidor Zabbix"
$zabbixHostname = Read-Host "Ingrese el Hostname para este agente"

# Variables
$zabbixUrl = "https://cdn.zabbix.com/zabbix/binaries/stable/7.2/7.2.4/zabbix_agent-7.2.4-windows-amd64-openssl.zip"
$zipFile = "$env:TEMP\zabbix_agent.zip"
$installDir = "C:\Zabbix"

# Descargar el agente
Write-Host "Descargando Zabbix Agent..."
Invoke-WebRequest -Uri $zabbixUrl -OutFile $zipFile

# Crear carpeta de instalación
Expand-Archive -Path $zipFile -DestinationPath $installDir -Force

# Modificar zabbix_agentd.conf
$configFile = "$installDir\conf\zabbix_agentd.conf"
(Get-Content $configFile) -replace "^Server=.*", "Server=$zabbixServerIP" |
  ForEach-Object { $_ -replace "^ServerActive=.*", "ServerActive=$zabbixServerIP" } |
  ForEach-Object { $_ -replace "^Hostname=.*", "Hostname=$zabbixHostname" } |
  Set-Content $configFile

# Instalar el servicio
Write-Host "Instalando servicio..."
& "$installDir\bin\zabbix_agentd.exe" --config "$configFile" --install

# Iniciar el servicio
Start-Service "Zabbix Agent"
Set-Service "Zabbix Agent" -StartupType Automatic

# Confirmación
Write-Host "Zabbix Agent instalado y en ejecución."
