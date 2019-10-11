echo start
chdir
for /f "tokens=1,2 delims==" %%i in (./deployeebat/deployeesettings.txt) do (
if "%%i"=="deployPath" set deployPath=%%j
if "%%i"=="testclass" set testclass=%%j
)

echo deployPath:%deployPath%
echo testclass:%testclass%

echo %GIT_COMMIT%
echo %GIT_BRANCH%
echo %WORKSPACE%
"C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/%deployPath%.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests %testclass% 
