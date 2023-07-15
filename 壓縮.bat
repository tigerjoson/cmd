chcp 65001
SET /p casenumber="casenumber="
set pathname=path
SET fullname=%pathname%%casenumber%
echo %fullname%

rem 7z a zipname sourcename
 "C:\Program Files\7-Zip\7z" a %fullname%.zip %fullname% -p"p@ssw0rd"
pause
