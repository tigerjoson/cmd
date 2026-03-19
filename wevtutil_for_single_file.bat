rem 依據時間
rem @echo off
:: 關閉命令提示字元的命令回顯功能，使腳本執行時不顯示命令本身
rem chcp 65001 > nul
:: 將控制台代碼頁設置為UTF-8（65001），> nul 表示隱藏命令執行結果
chcp 65001 

:: 遍歷當前目錄下所有副檔名為.evtx的事件記錄檔
for %%i in (*.evtx) do (
    :: 顯示當前正在處理的檔案名稱
    echo 正在處理檔案: %%i
    
    :: 使用Windows事件工具(wevtutil)查詢事件記錄
    :: /lf:true 表示包含記錄檔路徑資訊
    :: 查詢條件：篩選系統時間在2026-01-19 00:00:00至2026-01-20 00:00:00之間的事件
    :: 輸出格式為純文字(text)，並將結果儲存為同檔名的.txt檔案
    wevtutil qe /lf:true "%%i" ^
    /q:"*[System[TimeCreated[@SystemTime>='2026-01-19T00:00:00Z' and @SystemTime<'2026-01-20T00:00:00Z']]]" ^
    /f:text > "%%~ni.txt"
)

:: 所有檔案處理完成提示
echo 轉換完成！

:: 暫停腳本執行，等待用戶按鍵繼續
pause

rem   依據特定字串過濾
@echo off        :: 關閉命令提示字元的指令回顯功能，使執行過程不顯示命令本身
chcp 65001 > nul :: 將控制台字碼頁設為UTF-8(65001)以支援Unicode，> nul 表示隱藏設定成功的訊息

:: 迴圈處理當前目錄下所有 .evtx 檔案
for %%i in (*.evtx) do (
    echo 正在處理檔案: %%i  :: 顯示當前處理的檔案名稱
    
    :: 使用Windows事件工具(wevtutil)查詢事件日誌
    wevtutil qe /lf:true "%%i"  :: 從檔案(非即時日誌)讀取事件
        /q:"*[contains(.,'hb')]"  :: XPath查詢條件：篩選包含 'hb' 字串的事件內容
        /f:text > "%%~ni.txt"          :: 輸出格式為純文字，並儲存為同名.txt檔案
)

echo 篩選完成！  :: 顯示操作完成訊息
pause            :: 暫停執行，等待用戶按任意鍵繼續
