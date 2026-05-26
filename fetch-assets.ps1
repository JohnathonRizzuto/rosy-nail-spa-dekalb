# Fetch AI-generated assets for Rosy Nail & Spa from Canva CDN
# Run this on Windows before Stage 2 git-commits the build folder.
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $false

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$heroUrl = @"
https://export-download.canva.com/7VWCI/DAHKjh7VWCI/-1/0/0001-2320983897478065673.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUH5AO7UJ26%2F20260524%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20260524T010055Z&X-Amz-Expires=27225&X-Amz-Signature=be98553fb6b5b99fd20e34ec99ca230a6fa88dc7a81f3c8269b15e305bc85536&X-Amz-SignedHeaders=host%3Bx-amz-expected-bucket-owner&response-expires=Sun%2C%2024%20May%202026%2008%3A34%3A40%20GMT
"@
Write-Host "Downloading hero.jpg..."
try {
    Invoke-WebRequest -Uri $heroUrl -OutFile "$here\hero.jpg" -UseBasicParsing
    if (Test-Path "$here\hero.jpg") {
        $sz = (Get-Item "$here\hero.jpg").Length
        Write-Host "OK - hero.jpg downloaded ($sz bytes)"
    } else {
        Write-Host "WARN - hero.jpg missing after download"
    }
} catch {
    Write-Host "ERROR - hero fetch failed: $_"
    Write-Host "NOTE - the Canva presigned URL may have expired (~24h lifetime). Site will fall back to gradient background until logo swap at \$250 close."
}
