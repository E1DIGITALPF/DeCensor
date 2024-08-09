$dnsPrimary = "8.8.8.8"
$dnsSecondary = "8.8.4.4"

$networkAdapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Virtual -eq $false }

foreach ($adapter in $networkAdapters) {
    $interfaceAlias = $adapter.Name
    $interfaceIndex = $adapter.ifIndex

    $dnsSettings = Get-DnsClientServerAddress -InterfaceIndex $interfaceIndex

    if ($dnsSettings | Where-Object { $_.AddressFamily -eq "IPv4" }) {
        Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses ($dnsPrimary, $dnsSecondary)
        Write-Output "Configuración de DNS actualizada para el adaptador $interfaceAlias"
    } else {
        Write-Output "No se encontró configuración IPv4 para el adaptador $interfaceAlias"
    }
}

Write-Output "Todos los adaptadores con acceso a Internet han sido configurados con los DNS de Google."