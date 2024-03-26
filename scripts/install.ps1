# Installing Scoop on Windows
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install sudo

# Creating Symbolic Links for the config 
sudo New-Item -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\scripts\Microsoft.PowerShell_profile.ps1"
sudo New-Item -Path "$env:USERPROFILE\.config\pwsh\" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\pwsh"
sudo New-Itme -Path "$env:USERPROFILE\.config\themes" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\themes"
sudo New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.gitconfig"
sudo New-Item -Path "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.vimrc"
sudo New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\nvim"

