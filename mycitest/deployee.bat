echo start
set deployPath=package2
"C:\Program Files\Salesforce CLI\bin\sfdx" force:source:deploy -x ./manifest/%deployPath%.xml -u mycitestpartial --testlevel RunSpecifiedTests --runtests LWCUploadTPACtlTest