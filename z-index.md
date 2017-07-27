#### Z-Index documentation

This documents lists all elements that use z-index in any way, with reasons why and values used


| Element name | z-index value | Why?  |
| ------------ | ------------- | ----- |
| app-layout/app-box | 1 | for demo page purposes |
| app-layout/app-drawer-layout | 0, 1 | for ordering parent and child elements |
| app-layout/app-header | 1 | for demo page purposes |
| app-layout/app-header-layout | 0, 1 | for ordering parent and child elements |
| at-app-embed/at-app-embed-scaffold | 100 | for menu bar |
| at-app-embed/at-app-embed | 100 | for splash screen |
| at-app-embed/at-app-embed.js | 20000, 20001 | for iframe children |
| at-app-scaffold/at-app-drawer | 100, 3, 2 | for host element, content and mask |
| at-app-scaffold/at-app-scaffold | 100, 1000 | for bar and menu container |
| at-carbon-button/at-carbon-button | 0 | for host element container |
| at-carbon-card/swipe-action | 1001 | for host element while its being swipped |
| at-carbon-icon-button/at-carbon-icon-button | 0 | for host element |
| at-carbon-popup/at-carbon-popup-content | 1 | for host element |
| at-carbon-sidebar/at-carbon-sidebar | 1000 | for popup insert point that hosts the flyout |
| at-carbon-toast/lib/iziToast.css | 1, 9999, -1 | for progressbar, wrapper and shadow |
| at-core-cardlayout/at-core-cardlayout-desktop | 2 | for .dragging class |
| at-core-cardlayout/at-core-cardlayout-mobile | 2 | for .dragging class |
| at-core-dframe/styles/devices-styles | 900, 1, 2, 3, 0, 999, 5 | for various phone elements that are displayed on screen |
| at-core-dropdown/at-core-dropdown-impl | -1, 999, 2 | for container, outline, content and mask |
| at-core-mic/at-core-mic | 10 | for container when recognizing |
| at-core-modal/styles/at-core-modal-styles | 1000 | for overlay and contents |
| at-core-pdf/web/viewer html and css | -1, 200, 9999, 10000, 30000, 199, 99, 4000, 50000, 100, 9999999 | for various elements on screen |
| at-core-resize-sensor/at-core-resize-sensor | -10 | for internal object that is used to detect resizing |
| at-core-searchbox/filtered-list-demo | 1 | for app-toolbar
| at-core-theme | to many to list here | for default and carbon themes |
| at-form-cron/styles/jqcron-styles | 1 | for selector list |
| at-form-date/at-form-date-style | 1000 | for dropdown menu |
| at-form-file/at-form-file | 1 | for file container a tags |
| at-form-html/styles/quill-bubble, quill-snow | 1, 2 | for labels and options |
| at-form-lookup/at-form-lookup | 99999, 1, 10, 1000, 2| disabled overlay, remove button, dropdown |
| at-form-markdown/at-form-markdown | 99999 | fullscreen mode |
| at-journey/at-journey-container | 5000 | dframe container |
| at-journey/at-journey-scaffold | 100 | top bar |
| c3/c3 | 10 | for tooltips | 
| code-mirror/code-mirror | 1000 | fullscreen mode |
| code-mirror/tangere/addon/show-hint | 1100 | for hints container |
| code-mirror/codemirror/lib/codemirror.css | 1, 6, 3, 4, 2, 0, 2 | various editor elements |
