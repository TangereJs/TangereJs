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

Trigger travis-ci build

#### How to enable testing in IE11 on localhost
1. add internet explorer to [win-wct.conf.json](https://github.com/TangereJs/TangereJs/blob/master/win-wct.conf.json#L5) as `'ie'`
2. note the `%AppData%\Roaming\npm\node_modules\web-component-tester\node_modules\selenium-standalone\.selenium\iedriver`
3. also note the `%AppData%\Roaming\npm\node_modules\web-component-tester\node_modules\selenium-standalone\lib\default-config.js`
4. the `default-config.js` file declares that ie driver version of 3.9.0 should be installed and used. This version doesn't work on windows 10 and IE11. 
5. version [3.11.1-x64-IEDriverServer.zip](http://selenium-release.storage.googleapis.com/3.11/IEDriverServer_x64_3.11.1.zip) works
6. download the zip file, extract zip, copy `IEDriverServer.exe` to `iedriver` folder from **`2.`**, and rename to `3.9.0-x64-IEDriverServer.exe`
7. the rename is required because version `3.9.0` is declared in `default-config.js`
8. note the `%AppData%\Roaming\npm\node_modules\web-component-tester\node_modules\selenium-standalone\.selenium\selenium-server`
9. The installed version is `3.8.1`. This version doesn't work with `ie driver v3.11.1`
10. Download [selenium-server-standalone-3.12.0](http://selenium-release.storage.googleapis.com/3.12/selenium-server-standalone-3.12.0.jar), copy it to folder from **`7.`**
11. rename it to `3.8.1-server` because version `3.8.1` is declared in `default-config.js`
12. testing in IE11 now works

#### How to enable testing in Edge on localhost
1. add internet explorer to [win-wct.conf.json](https://github.com/TangereJs/TangereJs/blob/master/win-wct.conf.json#L5) as `'edge'`
2. open the `%AppData%\Roaming\npm\node_modules\web-component-tester\node_modules\wct-local\lib\browsers.js`
3. Note the `LAUNCHPAD_TO_SELENIUM` variable on Line 22
4. add entry for `edge` as `edge: edge`
5. `LAUNCHPAD_TO_SELENIUM` should now look like this
```javascript
const LAUNCHPAD_TO_SELENIUM = {
    chrome: chrome,
    canary: chrome,
    firefox: firefox,
    aurora: firefox,
    ie: internetExplorer,
    safari: safari,
    edge: edge // this one was added
};
```
6. Find the `// Launchpad -> Selenium` comment
7. Add following code bellow that line
```javascript
function edge(browser, browserOptions) {
    return {
        'browserName': 'MicrosoftEdge',
        'version': browser.version
    };
}
```
8. I do not quite understand why browser name has to be `MicrosoftEdge` instead of just `edge` but there you have it
9. note the `%AppData%\Roaming\npm\node_modules\web-component-tester\node_modules\selenium-standalone\.selenium\edgedriver`
10. note the version of EdgeHTML of you edge browser. For me it was Microsoft EdgeHTML 16.16299
11. My edge driver was 16299-MicrosoftEdgeDriver.exe, so the version of edgeHTML (.16299) and driver version (16299) should match
12. If edgeHtml version and driver versions do not match download and install a matching version from https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
13. testing on Edge now works
