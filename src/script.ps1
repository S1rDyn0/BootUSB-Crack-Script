while ($true) {
    $userInput = Read-Host "Command (type 'exit' to quit): "

    if ($userInput -eq "exit") {
        break
    }

    try {
        Invoke-Expression $userInput
    } catch {
        Write-Host "Error: $_"
    }
}