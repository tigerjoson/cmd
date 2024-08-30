rem ref: https://peterju.gitbooks.io/cmddoc/content/loop.html
rem folder only
FOR /D %%d IN (*) DO (
  ECHO %%d
)

rem find mp4,avi,mpg files
for %%i in (*.mp4 *.avi *.mpg) DO @echo %%i
