#### Polymer 2.x observations
##### Property changed handlers
property changed handlers are not called when element is not attached. So, setting `.value` property to a new value will not trigger `_valueChanged` observer function.
##### Observe changes to multiple properties
In Polymer 1.x
- Observers are not invoked until all dependent properties are defined `(!== undefined)`. So each dependent properties should have a default value defined in properties (or otherwise be initialized to a non-undefined value) to ensure the observer is called.

In Polymer 2.x
- Multi-property observers and computed properties run once at initialization if any dependencies are defined. After that, the observers run whenever there is `an observable change` to any dependency.

#### at-carbon-dialog migration
Element structure
- replace `<content>` with `<slot>`
- replace `::content` selector with `::slotted` selector
- use `apply --css-mixin-name;` syntax instead of `apply(--css-minin-name);`

Dependencies that have to be upgraded
- `IronOverlayBehavior` to 2.x
- `PaperDialogBehavior` to 2.x
- add `iron-flex-layout` dependency as 2.x
- add `at-carbon-icon` dependency as master
- [optional] `neon-animation` to 2.x

`bower.json` should look like this
```json
{
  "name": "at-carbon-dialog",
  "description": "A responsive Material Design dialog",
  "version": "2.0.0",
  "private": true,
  "dependencies": {
    "neon-animation": "PolymerElements/neon-animation#^2.0.0",
    "paper-dialog-behavior": "PolymerElements/paper-dialog-behavior#^2.0.0",
    "iron-overlay-behavior": "PolymerElements/iron-overlay-behavior#^2.0.0",
    "iron-flex-layout": "PolymerElements/iron-flex-layout#^2.0.0",
    "at-carbon-icon": "TangereJs/at-carbon-icon#master",
    "tangere": "tangere/tangere#master"
  }
}
```

### at-carbon-tabs migration
Element structure
- replace `<content>` with `<slot>`
- replace `::content` selector with `::slotted` selector

Dependencies to be upgraded
- `at-core-style-classes`
  * use `apply --css-mixin-name;` syntax instead of `apply(--css-minin-name);`
- `iron-flex-layout`
  * upgrade to 2.x

#### at-carbon-tabs/at-carbon-tab  migration
Element structure
- replace `<content>` with `<slot>`
- replace `::content` selector with `::slotted` selector

#### at-core-dashboard migration
Element code
- use displayTypeToFormElementMapping to compute elementName and pass that to schemaHelpers.createElement function
- for `at-core-dashboard-echo` element use customElements.get to check if imported

#### at-core-form migration
Element structure
- no changes

Element code
- use displayTypeToFormElementMapping to compute elementName and pass that to schemaHelpers.createElement function

Element dependencies
- `at-form-behaviors` needs to check if element is attached before rendering error message on `$.hint` element in html
- `at-form-*` elements have to update `validate` function, to check if element is attached before inspecting `$.input.value`
- `at-form-*` elements need to update `_updateUIValidState` function to check if element is attached before updating css classes on elements
  * `at-form-array`
  * `at-form-checkbox`
  * `at-form-checkbox-list`
  * `at-form-codemirror`
  * `at-form-cron`
  * `at-form-date`
  * `at-form-daterange`
  * `at-form-file`
  * `at-form-html`
  * `at-form-image`
  * `at-form-lookup`
  * `at-form-markdown`
  * `at-form-number`
  * `at-form-password`
  * `at-form-picker`
  * `at-form-radio`
  * `at-form-random`
  * `at-form-state`
  * `at-form-text`
  * `at-form-textarea`
- `at-form-markdown` internal elements `markdown-default-converter` and `markdown-sanitizing-decorator` have to be updated to work without being attached to the DOM or be attached to the DOM but hidden
- `at-core-activity` element doesn't send requests if not attached to the DOM. Property `activeRequests` is undefined

#### at-core-activity migration
**Merged changes into TangereJs Polymer 1.x because there are no compatibility issues.**

~~Element code~~
- ~~`element.properties.activeRequests.value` function must return empty array in Polymer 2.x. Existing `_setActiveRequests([])` doesn't work~~
- ~~Line 455: `this.$.msg.html = "";` should be changed to `if (this.$) this.$.msg.html = "";` to account for eleemnt not being attached~~

#### core-ajax/core-request migration
**Merged changes into TangereJs Polymer 1.x because there are no compatibility issues.**

~~Element code~~
- ~~`element.properties.xhr.value` function must return new `XMLHttpRequest`in Polymer 2.x. Existing `_setXhr(new XMLHttpRequest())` doesn't work~~
- ~~`element.properties.response.value` function must return `null` in Polymer 2.x. Existing `_setResponse(null)` doesn't work~~
- ~~`element.properties.completes.value` function must return `completes` local variable in Polymer 2.x. Existing `_setCompletes(completes)` doesn't work~~
- ~~`element.properties.progress.value` function must return `{}` in Polymer 2.x. Existing `_setProgress({})` doesn't work~~
          
#### at-core-style-classes
- Due to issue described [here](https://github.com/Polymer/polymer/issues/5196), test suite will not pass until issue is fixed. 
- Using the style dom modules to style main document works as can be seen in [this demo](https://github.com/TangereJs/Tangere/blob/master/demo/styling-main-document-with-style-modules.html)

#### at-form-complex
Element structure
- use `apply --css-mixin-name;` syntax instead of `apply(--css-minin-name);`

Element code
- use displayTypeToFormElementMapping to compute elementName and pass that to schemaHelpers.createElement function
- detect presence of shadowRoot when calling `getElement` and `_clearUIValidState`

#### at-form-array
- Scope of changes can be known only after `at-form-complex` works correctly, since `at-form-complex` is a direct dependency

#### at-form-daterange
Element code

Investigate why
- [value-tests.html line 201](https://github.com/TangereJs/at-form-daterange/blob/master/test/value-tests.html#L201) **does not trigger** _updateDaterangeFromStartAndEndDate function in `Polymer 1.x`
- [value-tests.html line 201](https://github.com/TangereJs/at-form-daterange/blob/master/test/value-tests.html#L201) **triggers** _updateDaterangeFromStartAndEndDate function in `Polymer 2.x`

