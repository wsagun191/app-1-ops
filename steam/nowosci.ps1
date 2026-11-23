$ErrorActionPreference = 'Stop'
$appid = Get-Content -LiteralPath "steam/gra.json" -Raw
$gra = $appid | ConvertFrom-Json
$dane = Invoke-RestMethod -Uri "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=$($gra.appid)&count=1&maxlength=300&feeds=steam_community_announcements" -UseBasicParsing -TimeoutSec 20
$news = $dane.appnews.newsitems[0]
Write-Output "$($news.title) | $($news.url)"
