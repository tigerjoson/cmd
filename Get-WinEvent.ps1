Get-WinEvent -Path "C:\logs\app.evtx" `
    -FilterXPath "*[System[TimeCreated[@SystemTime>='2026-01-19T00:00:00.000Z']]]" |
    Where-Object { $_ } |
    Export-Csv -Path "C:\logs\output.csv" -Encoding UTF8 -Delimiter ';' 
