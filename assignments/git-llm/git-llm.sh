#!/bin/bash
git diff --cached > staged_changes.txt

cat << EOF > prompt.txt
You are a helpful assistant that generates clear and concise git commit messages.
Below are the staged changes for a git commit. Please summarize these changes in a single sentence, following these rules:
- Start with a present-tense verb
- Be specific but concise
- Focus on the "what" and "why", not the "how"
- Don't exceed 72 characters
Here are the changes:
$(cat staged_changes.txt)
EOF

llm --model groq-llama3.1-70b < prompt.txt > commit_msg.txt

COMMIT_MSG=$(cat commit_msg.txt)
echo
echo "Suggested commit message:"
echo "$COMMIT_MSG"
echo

read -p "Do you want to commit with this message? (Y/N): " CONFIRM
if [[ $CONFIRM =~ ^[Yy]$ ]]; then
    git commit -m "$COMMIT_MSG"
    echo "Commit successful!"
else
    echo "Commit cancelled."
fi

# Clean up temporary files
rm staged_changes.txt prompt.txt commit_msg.txt