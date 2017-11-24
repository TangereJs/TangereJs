prepare the development environment
--

To setup your own development tree start with cloning this repo (https://github.com/TangereJs/TangereJs).

Then run 

**update.sh** *user* *pass*

where *user* is your github user name and *pass* is your password.

This will first save any components/at- directories (which fails the first time, but this can savely be ignored), then uses bower to get all dependencies, restores the saved components/at- and then uses git to check out the full components/at- repos.

After the script is finished all at- components contain complete the git repos. So the files can be changed and then directly pushed to git.

