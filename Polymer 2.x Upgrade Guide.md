#### at-carbon-dialog migration to Polymer 2.x
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

### at-carbon-tabs migration to Polymer 2.x
Element structure
- replace `<content>` with `<slot>`
- replace `::content` selector with `::slotted` selector

Dependencies to be upgraded
- `at-core-style-classes`
  * use `apply --css-mixin-name;` syntax instead of `apply(--css-minin-name);`
- `iron-flex-layout`
  * upgrade to 2.x

#### at-carbon-tabs/at-carbon-tab  migration to Polymer 2.x
Element structure
- replace `<content>` with `<slot>`
- replace `::content` selector with `::slotted` selector
