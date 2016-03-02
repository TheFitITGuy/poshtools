﻿param($VSIXPath)

if ($Env:APPVEYOR_PULL_REQUEST_NUMBER -ne $null)
{
    return
}

$ToolPath = (Join-Path $PSScriptRoot '..\packages\Microsoft.VSSDK.Vsixsigntool.14.1.24720\tools\vssdk\vsixsigntool.exe')

Set-Location $PSScriptRoot
Start-Process $ToolPath -ArgumentList "sign /f DigiCertNov2016.pfx /sha1 ‎62ce2356c213011cc8996c285a67a12663ad2c5c /p $Env:signing_code /v /t http://timestamp.digicert.com $VSIXPath" -NoNewWindow 
