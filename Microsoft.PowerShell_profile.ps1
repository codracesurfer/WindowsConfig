
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

function Set-WindowsTerminalContext {
    $loc = $executionContext.SessionState.Path.CurrentLocation
    
    if ($loc.Provider.Name -eq "FileSystem") {
        $prompt = "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
        $host.ui.Write($prompt)
    }
}

# Add this before the oh-my-posh init
New-Alias -Name 'Set-PoshContext' -Value 'Set-WindowsTerminalContext' -Force

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussell.omp.json" | Invoke-Expression
Set-Alias -Name edit -Value "C:\Program Files\Notepad++\notepad++.exe"
Set-Alias -Name vim -Value "C:\Program Files\Vim\vim91\vim.exe"
Set-Alias -Name python3 -Value python
Set-Alias -Name gh -Value Get-Help
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

function admin {
    Start-Process 'wt.exe' -Verb RunAs
}
function .. {
    cd ..
}
function b64d($base64) {
    return [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($base64))
}

function b64e($plain) {
    return [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($plain))
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
