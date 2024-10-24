@echo off
set /p changes= < git diff --cached --name-only
set /p message= < llm --prompt "Summarize the following changes in one sentence: %changes%"
echo %message%
set /p response=
if /i "%response%"=="y" git commit -m "%message%"
