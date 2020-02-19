# HealthChecksIOStatusReport
Powershell module to quickly report status to HealthChecks.io , this module
targets PowerShell 4.0 and later (supporting Windows Server 2012R2 and later).


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

You may want to report logs too, you can do this with the -AttachLogs parameter, allowing you to post arbitrary string data on success/failure.

```
Invoke-HealthChecksIOStatusReport -Success -uuid $cfgUUID -AttachLogs ($error|out-string)
```
