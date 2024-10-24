## Notes on learning experience:

3rd week:
v0 was able to quickly create the app. However, I had to specify that I wanted a version that would run in a git repository (meaning that it included the required dependencies). There was some tedium due to being forced to download each file individually, create the directories myself, and rename the files to the proper names since v0 cannot provide a complete zip file. Finally, there was an error due to v0 not telling me to install a certain dependecy which was quickly resolved after telling it the error message.

5th week:
This time I used Aider to modify my old button app by making the button teleport away whenever you click on it. I also used Aider for other minor changes like changing the text displayed. It was relatively to set up and use Aider, and it seemed to be more useful to my needs than v0 because it made more minimialistic and human-readable changes and told me exactly what it had done. It also let me easily undo the changes if they had problems. It was not able to do changes if they were too complex, such as moving the button simply by mousing over it without clicking.

7th week:
For this week I installed the llm CLI tool and a plugin to be able to use it with a remote groq model. I then used Aider to create a Windows batch script (and a unix bash script version) which prompts LLM to generate a commit message that reflects the currently staged changes for commit. Aider's first try with llama3-70b-8192 was broken, but I had the opportunity to try some other LLMs and eventually edited it to a working version. It now functions, in that the user first uses "git add" to stage the desired changes manually, and then runs "git-llm.bat" to generate a commit message. In conclusion, it seems that llama3-70b-8192 is not powerful enough to produce correct shell script code.

Note: I can't test the bash script version, because I don't have a Mac/Unix computer.

## Screenshot of app:

![screenshot](button_app_2.png "Button App")