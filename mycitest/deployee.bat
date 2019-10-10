echo start

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
echo user:%user%
echo password:%password%
echo expath:%expath%
echo date:%date%
echo database:%database%
echo ip:%ip%
————————————————
版权声明：本文为CSDN博主「kingdom♚蓝调」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_24400639/article/details/68927103
"C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/%deployPath%.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests LWCUploadTPACtlTest