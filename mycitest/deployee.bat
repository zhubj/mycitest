echo start
@echo off

set result=('"C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/package2.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests LWCUploadTPACtlTest')

for /f "delims=" %%i in (%result%) do (

    set lastLine=%%~i

)

echo %lastLine%

pause
