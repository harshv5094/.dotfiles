# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Invoke Starship Prompt
Invoke-Expression (&starship init powershell)

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Aliases
Set-Alias ll ls
Set-Alias g git
set-Alias lg lazygit
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# Make Symbolic Links 
function make-link ($target, $link){
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

# Windows Utility Script By ChrisTitusTech
function winutil (){
  irm "https://christitus.com/win" | iex
}
