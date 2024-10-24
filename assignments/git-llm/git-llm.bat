@echo off
git diff --cached > staged_changes.txt
(
	echo You are a helpful assistant that generates clear and concise git commit messages.
    echo Below are the staged changes for a git commit. Please summarize these changes in a single sentence, following these rules:
    echo - Start with a present-tense verb
    echo - Be specific but concise
    echo - Focus on the "what" and "why", not the "how"
    echo - Don't exceed 72 characters
    echo Here are the changes:
    type staged_changes.txt
) > prompt.txt
llm --model groq-llama3.1-70b < prompt.txt > commit_msg.txt

set /p COMMIT_MSG=<commit_msg.txt
echo.
echo Suggested commit message:
echo %COMMIT_MSG%
echo.

set /p CONFIRM="Do you want to commit with this message? (Y/N): "
if /i "%CONFIRM%"=="Y" (
    git commit -m "%COMMIT_MSG%"
    echo Commit successful!
) else (
    echo Commit cancelled.
)

REM Clean up temporary files
del staged_changes.txt prompt.txt commit_msg.txt