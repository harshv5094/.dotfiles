# Adding which function
function which ($command)
{
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

$promptEditor = which "oh-my-posh"
if($promptEditor)
{
  oh-my-posh init pwsh --config "~/.config/themes/linux.omp.toml" | Invoke-Expression
}

# Changing Text Color for transparency
if ($IsCoreCLR)
{
  $esc = "`e"
} else
{
  $esc = $([char]0x1b)
}
Set-PSReadLineOption -Colors @{
  Parameter = "$esc[96m"
  Operator  = "$esc[38;5;47m"
  comment   = "$esc[92m"
  String    = "$esc[38;5;51m"
}

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

#ssh
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# PSReadLine
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Fzf
Import-Module posh-git
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -EnableAliasFuzzyGitStatus

# Terminal Icons
Import-Module Terminal-Icons

$checkEza = which "eza"
if ($checkEza)
{
  function ll
  {
    eza $args -lg --bytes --icons --header
  }

  function la
  {
    eza $args -lga --bytes --icons --header
  }
}

# neovim config view
function vimview
{Set-Location "~/AppData/Local/nvim" && Get-ChildItem 
} 

# neovim config edit
function vimedit
{
  Set-Location $env:LOCALAPPDATA\nvim\ && nvim .
} 

# pwsh config edit
function pwshedit
{ 
  nvim $env:USERPROFILE\.config\pwsh\user_profile.ps1
}

# pwsh config view
function pwshview
{
  Set-Location "$env:USERPROFILE/.config/powershell/" && Get-ChildItem 
}

# Function for prompt edit
function promptedit
{ nvim $env:USERPROFILE\.dotfiles\.config\themes\harsh.omp.json 
}

# Terminal Config Editing (Windows)
function wtview
{ 
  Set-Location $env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\ 
}
function wtedit
{ nvim $env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json 
}

# Function for winget config 
function winget_edit
{
  nvim $env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json
}

# Importing My Custom set alias script

# Setting Aliases
Set-Alias apt scoop
Set-Alias g git
Set-Alias gpt Get-PoshThemes
Set-Alias touch New-Item
Set-Alias vim nvim
Set-Alias tigg 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias eth Get-NetIPAddress
Set-Alias fdir Get-ChildItem
Set-Alias grep findstr
Set-Alias lg lazygit

