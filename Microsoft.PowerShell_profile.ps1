# This goes to folder C:\Users\<USERNAME>\Documents\PowerShell
# and $Profile is set to this file path

Import-Module Z
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Import-Module PSReadLine
Import-Module PSFzf

# VirtualEnv Env variable
$env:VIRTUAL_ENV_DISABLE_PROMPT=1

# Set Theme
Set-PoshPrompt -Theme the-unnamed
oh-my-posh init pwsh --config $Profile/../MyTheme.omp.json | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# Fzf
Set-PsFzfOption -PsReadLineChordProvider 'Ctrl+f' -PSReadLineChordReverseHistory 'Ctrl+r'

# Alias (Optional)
Set-Alias vim nvim
Set-Alias g git
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Ultilities (Optional)
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function touch {
    New-Item -ItemType File -Name ($args[0])
}
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}