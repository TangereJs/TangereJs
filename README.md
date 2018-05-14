prepare the development environment
--

To setup your own development tree start with cloning this repo (https://github.com/TangereJs/TangereJs).

Then run 

**update.sh** *user* *pass*

where *user* is your github user name and *pass* is your password.

This will first save any components/at- directories (which fails the first time, but this can savely be ignored), then uses bower to get all dependencies, restores the saved components/at- and then uses git to check out the full components/at- repos.

After the script is finished all at- components contain complete the git repos. So the files can be changed and then directly pushed to git.

#### Run tests locally with web-component-tester

1. Install [node.js](www.nodejs.org)

2. Open command prompt with Administrative priveleges. `mklink` command requires admin preveleges

3. Install bower with npm

    `npm install -g bower`

4. Install wct with npm

    `npm install -g web-component-tester`
5. Clone https://github.com/TangereJs/TangereJs into folder of your choice

    `git clone https://github.com/TangereJs/TangereJs`
6. run bower install for tangerejs

    `bower install`
7. navigate to component of your choice (ie. `at-form-text`)

    `cd components`
    
    `cd at-form-text`

8. create a symlink for tangerejs/components with name of bower_components

    `mklink /D bower_components c:\<path_to_folder_of_your_choice>\TangereJs\components`
9. run wct


#### Run tests on Travis-CI
1) Login on travis-ci.org with your github credentials
2) travis-ci will import repositories from github which have .travis.yml file
3) To run tests your account has to be the owner of the repository
4) Click **My Repositories** link on the panel on the left
5) Click on the repository of your choice
6) Click **build** on the panel on the right

