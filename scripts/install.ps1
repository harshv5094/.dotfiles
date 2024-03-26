# Installing Scoop on Windows
function Install-Scoop
{
  if (Test-Path -Path "$env:USERPROFILE\scoop")
  {
    Write-Output "Scoop is already installed."
  } else
  {
    Write-Output "Installing Scoop...."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    # Enable the extras bucket
    scoop bucket add extras
  }
}

# Installing scoop packages
function Install-Scoop-Packages
{
  if (Test-Path -Path "$env:USERPROFILE\scoop")
  {
    $packageFile = "$env:USERPROFILE\.dotfiles\scripts\scoop-file.txt"
    # Read the file line by line and install the packages
    Get-Content $packageFile | ForEach-Object {
      $packageName = $_.Trim()
      Write-Output "Installing package: $packageName"
      scoop install $packageName
    }
  } else
  {
    Write-Output "Please Install Scoop First"
  }
}

# Creating Symbolic Links for the config 
function Copy-Folder-Links
{
  if (Test-Path -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" )
  {
    Write-Output "Removing the existing Microsoft.PowerShell_profile.ps1 file."
    Remove-Item -Recurse -Force "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    Write-Output "Creating the Symbolic Link for Microsoft.PowerShell_profile.ps1"
    sudo New-Item -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\scripts\Microsoft.PowerShell_profile.ps1"
  } else
  {
    Write-Output "Creating the Symbolic Link for Microsoft.PowerShell_profile.ps1"
    sudo New-Item -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\scripts\Microsoft.PowerShell_profile.ps1"
  }

  if (Test-Path -Path "$env:USERPROFILE\.config\pwsh")
  {
    Write-Output "Removing the existing pwsh directory."
    Remove-Item -Recurse -Force "$env:USERPROFILE\.config\pwsh"
    Write-Output "Creating the Symbolic Link for pwsh directory."
    sudo New-Item -Path "$env:USERPROFILE\.config\pwsh\" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\pwsh"
  } else
  {
    Write-Output "Creating the Symbolic Link for pwsh directory."
    sudo New-Item -Path "$env:USERPROFILE\.config\pwsh\" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\pwsh"
  }

  if (Test-Path -Path "$env:USERPROFILE\.config\themes")
  {
    Write-Output "Removing the existing themes directory."
    Remove-Item -Recurse -Force "$env:USERPROFILE\.config\themes"
    Write-Output "Creating the Symbolic Link for themes directory."
    sudo New-Itme -Path "$env:USERPROFILE\.config\themes" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\themes"
  } else
  {
    Write-Output "Creating the Symbolic Link for themes directory."
    sudo New-Itme -Path "$env:USERPROFILE\.config\themes" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\themes"
  }

  if (Test-Path -Path "$env:USERPROFILE\.gitconfig")
  {
    Write-Output "Removing the existing .gitconfig file."
    Remove-Item -Recurse -Force "$env:USERPROFILE\.gitconfig"
    Write-Output "Creating the Symbolic Link for .gitconfig file."
    sudo New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.gitconfig"
  } else
  {
    Write-Output "Creating the Symbolic Link for .gitconfig file."
    sudo New-Item -Path "$env:USERPROFILE\.gitconfig" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.gitconfig"
  }

  if (Test-Path -Path "$env:USERPROFILE\.vimrc")
  {
    Write-Output "Removing the existing .vimrc file."
    Remove-Item -Recures -Force "$env:USERPROFILE\.vimrc"
    Write-Output "Creating the Symbolic Link for .vimrc file."
    sudo New-Item -Path "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.vimrc"
  } else
  {
    Write-Output "Creating the Symbolic Link for .vimrc file."
    sudo New-Item -Path "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\dot\.vimrc"
  }

  if (Test-Path -Path "$env:LOCALAPPDATA\nvim")
  {
    Write-Output "Removing the existing nvim directory."
    Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim"
    Write-Output "Creating the Symbolic Link for nvim directory."
    sudo New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\nvim"
  } else
  {
    Write-Output "Creating the Symbolic Link for nvim directory."
    sudo New-Item -Path "$env:LOCALAPPDATA\nvim" -ItemType SymbolicLink -Value "$env:USERPROFILE\.dotfiles\.config\nvim"
  }

}

function Install-Pwsh-Packages
{
  Write-Output "Installing Posh Git"
  Install-Module posh-git -Scope CurrentUser -Force
  Write-Output "Installing Terminal-Icons"
  Install-Module -Name Terminal-Icons -Repository PSGallery -Force
  Write-Output "Installing z (Directory Jumper)"
  Install-Module -Name z -Force
  Write-Output "Installing PSReadLine"
  Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -SkipPublisherCheck -Force
  Write-Output "Installing PSFzf"
  Install-Module -Name PSFzf -Scope CurrentUser -Force
}


function Show-Menu
{
  Write-Host "=== Menu ==="
  Write-Host "1. Install Scoop"
  Write-Host "2. Install Scoop Packages"
  Write-Host "3. Link My Directories"
  Write-Host "4. Install Powershell Packages"
  Write-Host "Q. Quit"
}

function Get-Choice
{
  $choice = Read-Host "Your Choice"
  return $choice.ToUpper()
}

Do
{
  Show-Menu
  $choice = Get-Choice

  Switch ($choice)
  {
    1
    { 
      Install-Scoop 
    }

    2
    { 
      Install-Scoop-Packages 
    }

    3
    {
      Copy-Folder-Links
    }

    4 
    {
      Install-Pwsh-Packages
    }

  }

} While ($choice -ne "Q")


