Import-Module posh-git
#Import-Module oh-my-posh
#Set-Theme Paradox
Set-Alias ls Get-ChildItemColor -option AllScope -Force
Set-Alias dir Get-ChildItemColor -option AllScope -Force

$script:sessionErrorCount = $Global:Error.Count

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function Test-LastCommandFailed {
  # https://github.com/JanDeDobbeleer/oh-my-posh/blob/d7c62c4ff8e7c3bada252a427e70d26aa49dc245/oh-my-posh.psm1#L15
  $failed = ($Global:Error.Count -gt $sessionErrorCount) -or -not $?
  $script:sessionErrorCount = $Global:Error.Count
  return $failed
}

function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    #Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
    Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Cyan

    if ($s -ne $null) {  # color for PSSessions
        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
        Write-Host ") " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host " · " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkGray

    Write-Host ""
    if (Test-LastCommandFailed) {
      Write-Host "✘ " -NoNewline -ForegroundColor Red -BackgroundColor Black
    } #else {
    #  Write-Host "✓ " -NoNewline -ForegroundColor Green
    # }

    if (Test-Administrator) {  # Use different username if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }
    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Cyan
    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

function ConvertFrom-Base64 {
  # https://stackoverflow.com/questions/11880114/how-do-you-write-a-powershell-function-that-reads-from-piped-input
  param(
    [Parameter(ValueFromPipeline = $true)]
    $val
  )

  # https://stackoverflow.com/questions/15414678/how-to-decode-a-base64-string
  [Text.Encoding]::Utf8.GetString([Convert]::FromBase64String($val))
}


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
