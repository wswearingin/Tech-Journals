param($network, $server)

Write-Host IP NAME

for ($i=0;$i -lt 255;$i++) {
    $name = Resolve-DnsName -DnsOnly $network'.'$i -Server $server -ErrorAction Ignore | Select-Object -ExpandProperty "NameHost"
    if ($null -ne $name) {
        Write-Host $network'.'$i $name
    }
}
