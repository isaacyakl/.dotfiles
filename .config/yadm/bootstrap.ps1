if (-not (Get-Command shellcheck -ErrorAction SilentlyContinue)) {
    Write-Host "Installing ShellCheck"
    winget install --id koalaman.shellcheck
}