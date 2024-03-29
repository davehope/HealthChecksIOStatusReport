@{
    RootModule        = 'DaveHope.HealthChecksIOStatusReport.psm1'
    ModuleVersion     = '1.2.2'
    GUID              = 'f48c052a-ed97-46a3-a9e3-693dcd511f70'
    Author            = 'Dave Hope'
    Copyright         = '(c) 2020 Dave Hope. All Rights Reserved.'
    Description       = 'PowerShell module to send status reports to https://healthchecks.io/'
    PowerShellVersion = '4.0'
    RequiredModules   = @()
    FunctionsToExport = 'Invoke-HealthChecksIOStatusReport'
    PrivateData       = @{
        PSData = @{
            Tags       = @('Monitoring')
            ProjectUri = 'https://github.com/davehope/HealthChecksIOStatusReport'
        }
    }
}
