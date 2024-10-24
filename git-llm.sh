#!/bin/bash
changes=$(git diff --cached --name-only)
message=$(llm --prompt "Summarize the following changes in one sentence: $changes")
echo "$message"
read -p "Use this message? (y/n) " response
if [ "$response" == "y" ]; then
    git commit -m "$message"
fi
