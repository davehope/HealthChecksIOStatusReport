﻿Function Invoke-HealthChecksIOStatusReport
{
    <#
    .SYNOPSIS
    Reports various status events to Healthchecks.io. An account is required
    for use.
    #>
    [cmdletbinding()]
    Param(
        [Parameter(ParameterSetName='Success')][Switch]$Success,
        [Parameter(ParameterSetName='Failure')][Switch]$Failure,
        [Parameter(ParameterSetName='Start')][Switch]$Start,
        [Parameter(Mandatory=$true)][string]$uuid,
        [Parameter()][string]$AttachLogs
        )

    $uri = "https://hc-ping.com/$uuid"

    if($Success){}
    If($Failure){ $uri += "/fail" }
    If($Start){ $uri += "/start"}

    $httpRes = $null
    try
    { 
        if($null -ne $AttachLogs)
        {
            # See https://healthchecks.io/docs/attaching_logs/
            # When using HTTP POST, you can include arbitrary payload in the
            # request body. If the request body looks like a UTF-8 string,
            # Healthchecks.io will log the first 10 kilobytes of the request
            # body, so you can inspect it later.
            $httpRes = Invoke-RestMethod -Uri $uri -UseBasicParsing -Method Post -Body $AttachLogs
        }
        else
        {
            $httpRes = Invoke-RestMethod -Uri $uri -UseBasicParsing
        }
    }
    catch
    {
        Write-Warning "Failed to report status - $_"
    }

}