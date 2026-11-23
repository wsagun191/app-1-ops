
$ErrorActionPreference = "Stop"

$config = Get-Content -LiteralPath "steam/gra.json" -Raw
$gra = $config | ConvertFrom-Json

$parametry = @{
    appid = $gra.appid
    languages = @('all')
    num_per_page = 1
    purchase_type = 1
}

$parametryJson = $parametry | ConvertTo-Json -Compress

$response = Invoke-RestMethod `
    -Uri "https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/" `
    -Body @{ input_json = $parametryJson } `
    -UseBasicParsing `
    -TimeoutSec 20

Write-Output "Gra: $($gra.nazwa)"
Write-Output "Ocena graczy: $($response.response.query_summary.review_score_desc)"
Write-Output "Liczba recenzji: $($response.response.query_summary.total_reviews)"
