
$ErrorActionPreference = "Stop"
$appid = 570

$url = "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$appid"

$response = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

Write-Output "ID gry: $appid"
Write-Output "Liczba graczy online: $($response.response.player_count)"
