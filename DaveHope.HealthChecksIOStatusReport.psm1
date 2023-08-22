Function Invoke-HealthChecksIOStatusReport
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
        [Parameter(Mandatory)][string]$uuid,
        [Parameter()][string]$AttachLogs,
	    [Parameter()][Int32]$TimeoutSec = 10
        )

    $uri = 'https://hc-ping.com/' + $uuid

    if($Success){}
    If($Failure){ $uri += '/fail' }
    If($Start){ $uri += '/start' }

    $irmArguments = @{
	    Uri        = $uri
	    TimeoutSec = $TimeoutSec
    }

    # WindowsPowerShell 5.1 will likely be set to 'Ssl3, Tls' (SSL3, TLS1.0) on
    # platforms such as Windows Server 2016. Add Tls12 in preparation for HCIO
    # disabling legacy TLS protocols.
    if ([Net.ServicePointManager]::SecurityProtocol -notcontains [Net.SecurityProtocolType]::Tls12)
    {
        [Net.ServicePointManager]::SecurityProtocol += [Net.SecurityProtocolType]::Tls12
    }

    try
    {
        if($null -ne $AttachLogs)
        {
            # See https://healthchecks.io/docs/attaching_logs/
            # When using HTTP POST, you can include arbitrary payload in the
            # request body. If the request body looks like a UTF-8 string,
            # Healthchecks.io will log the first 10 kilobytes of the request
            # body, so you can inspect it later.
            Invoke-RestMethod -Method Post -Body $AttachLogs @irmArguments | Out-Null
        }
        else
        {
            Invoke-RestMethod @irmArguments | Out-Null
        }
    }
    catch
    {
        Write-Warning ('Failed to report status - {0}' -f $_)
    }
}