chcp 65001
wevtutil qe /lf:true "C:\logs\app.evtx" ^
/q:"*[System[TimeCreated[@SystemTime>='2026-01-19T00:00:00Z' and @SystemTime<'2026-01-20T00:00:00Z']]]" ^
/f:text
pause
