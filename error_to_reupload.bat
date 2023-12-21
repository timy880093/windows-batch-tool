@echo off
setlocal enabledelayedexpansion

set "folderpath=error"
set "targetpath=%folderpath%\reupload"
set "delimiter=-"

rem "copy all error files to reupload folder"
mkdir %targetpath%
for /R "%folderpath%" %%F in (*.error*) do (
    copy "%%F" "%targetpath%"
)

rem "rename all error files in reupload folder to xxx-xxx-xxx.xml"
for /R "%targetpath%" %%F in (*.error*) do (
    set "filename=%%~nxF"
    for /f "tokens=1-3 delims=%delimiter%" %%a in ("!filename!") do (
        set "part1=%%a"
        set "part2=%%b"
        set "part3=%%c"
    )
    set "newfilename=!part1!-!part2!-!part3!.xml"
    ren "%%F" "!newfilename!"
)

endlocal

