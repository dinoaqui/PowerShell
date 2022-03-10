# Create by Thiago Oliveira
# Get Activity Log by date and generate file logs.csv

$logs = Get-AzActivityLog -ResourceProvider Microsoft.KeyVault -StartTime 2022-02-25 -EndTime 2022-03-03

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
