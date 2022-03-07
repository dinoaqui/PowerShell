# Create by Thiago Oliveira
# Get Activity Log by date and generate file logs.csv

$logs = Get-AzLog -StartTime 2022-01-01 -EndTime 2022-01-30 -ResourceProvider Microsoft.KeyVault

$output = foreach ($log in $logs){
    New-Object -TypeName PSObject -Property @{
        Authorization = $log.Authorization
        Propiedades = $log.Properties
        OperationName = $log.OperationName
        User = $log.Caller
        Data = $log.EventTimestamp
        Level = $log.Level
        Status = $log.Status
    } | Select-Object Authorization, Propiedades, OperationName, User, EventTimestamp, Level, Status
}

$output | Export-Csv .\logs.csv -NoTypeInformation
