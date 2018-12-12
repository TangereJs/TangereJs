## How to update polymer in Commonlib.Polymer/Components/es5

To successfuly complete the update you need to install `nodejs` first. At the time of writing, latest version is `11.4.0`.

## Install polymer-cli

At the time of writing, latest version is `1.9.2`. 

`polymer-cli` has to be installed as a `global` npm package.

The command to do so is `npm install -g polymer-cli`.

## Navigate to components/ie11-build

Execute `bower install`

## Do the build

Next, open `index.html` in a text editor.

Add the following to head section of the `index.html` file if missing

`<script src="components/webcomponentsjs/webcomponents-lite.js"></script>`

`<link rel="import" href="components/polymer/polymer.html">`

`<link rel="import" href="ie11build-element.html">`

Next, open the `ie11build-element.html` and replace the
- `<link rel="import" href="../polymer/polymer-element.html">` with 
- `<link rel="import" href="components/polymer/polymer-element.html">`

Next, execute the following command `polymer build --js-compile`.

 This will build the webcomponents, polymer and polymer-element for IE11.

## Update the es5 folder

Navigate to `ie11-build\build\default`. There you will see `components` folder and `index.html` and `ie11build-element.html`. 

`components` folder contains the built version of `webcomponents`, `polymer` and `shadycss`. 

`index.html` contains the `<script>` tags with babel helpers.

You copy the contents of `root\build\default\components` to `Commonlib.Polymer\Components\es5`.

## Updating the `adenin.Gatekeeper\Views\App`

You have to update `adenin.Gatekeeper\Views\App\NowLauncher-v2.liquid` and `adenin.Gatekeeper\Views\App\NowLauncher-sw-v2.liquid` with babel-helpers.

Copy the script tags which contain `babelHelpers` from `ie11-build\build\default\index.html` to `NowLauncher-v2.liquid` and `NowLauncher-sw-v2.liquid`.
