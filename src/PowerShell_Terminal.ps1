while ($true) {
    $userInput = Read-Host "Command (type 'exit' to quit): "

    if ($userInput -eq "exit") {
        break
    }

    try {
        Invoke-Expression $userInput
	Write-Host " "
    } catch {
        Write-Host "Error: $_"
	Write-Host " "
    }
}