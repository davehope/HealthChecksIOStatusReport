# HealthChecksIOStatusReport
Powershell module to quickly report status to HealthChecks.io


## Usage

Define a variable for your UUID:
```
$cfgUUID = '00000000-00000=-0000-0000-000000000000'
```

As early in your script as possible, tell HealthChecks.io that you're starting
```
Invoke-HealthChecksIOStatusReport -Start -uuid $cfgUUID
```


At the end of your script, report success (or failure)
```
Invoke-HealthChecksIOStatusReport -Success -uuid $cfgUUID
```
