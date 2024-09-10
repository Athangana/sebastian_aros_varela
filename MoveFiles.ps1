# Define el directorio donde se encuentran los archivos originales
$sourceDir = "C:\Users\Sebastian\OneDrive - IACC\Escritorio"

# Define los directorios de destino para los archivos .bak y .log
$backupDir = "$sourceDir\baks"
$logDir = "$sourceDir\logs"

# Crea los directorios de destino si no existen
if (-not (Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir
}
if (-not (Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir
}

# Mueve los archivos .bak y .log al directorio correspondiente
Get-ChildItem -Path $sourceDir -Filter "*.bak" |
    Where-Object { $_.Name -like "*SEBASTIAN_AROS.bak" } |
    Move-Item -Destination $backupDir

Get-ChildItem -Path $sourceDir -Filter "*.log" |
    Where-Object { $_.Name -like "*SEBASTIAN_AROS.log" } |
    Move-Item -Destination $logDir

# Mostrar mensaje final
Write-Output "Los archivos han sido movidos correctamente."
