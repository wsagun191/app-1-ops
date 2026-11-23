$ErrorActionPreference = 'Stop'
$appid = 570
$dane = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$appid" -UseBasicParsing -TimeoutSec 20
Write-Output "Steam $appid | gracze teraz: $($dane.response.player_count)"
