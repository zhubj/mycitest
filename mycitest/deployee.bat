echo start1

for /f "tokens=1,2 delims==" %%i in (deployeesettings.txt) do (
if "%%i"=="deployPath" set deployPath=%%j
if "%%i"=="testclass" set testclass=%%j
if "%%i"=="user" set user=%%j
if "%%i"=="password" set password=%%j
if "%%i"=="expath" set expath=%%j
if "%%i"=="date" set date=%%j
if "%%i"=="ip" set ip=%%j
if "%%i"=="tables" set tables=%%j
if "%%i"=="database" set database=%%j
)
::if "%1"=="" (echo user不能为空) else (set user="%1")
::if "%2"=="" (echo password不能为空) else (set password="%2")
::if "%3"=="" (echo expath不能为空) else (set expath="%3")
::if "%4"=="" (set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%") else (set Ymd="%4")
::if "%5"=="" (echo table不能为空) else (set table="%5")
::rem FOR %%C IN (*.BAT *.TXT *.SYS) DO TYPE %%C
::rem 表示此命令后的字符为解释行（注释）
::rem set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"
::rem set "user=%1"
::rem set "password=%2"
::rem set "path=%3"
echo deployPath:%deployPath%
echo testclass:%testclass%
::REM echo user:%user%
::REM echo password:%password%
::REM echo expath:%expath%
::REM echo date:%date%
::REM echo database:%database%
::REM echo ip:%ip%
echo %GIT_COMMIT%
echo %GIT_BRANCH%
echo %WORKSPACE%
"C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/%deployPath%.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests testclass
::REM set result1=%ERRORLEVEL%
::REM echo %result1%
::REM  "C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/%deployPath%.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests test.cls
::REM set result2=%ERRORLEVEL%
::REM echo %result2%