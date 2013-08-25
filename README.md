### Usage

bootstrap:

```coffeescript

pc         = require "paperclip"
pcc        = require "paperclip-component"
bindable   = require "bindable"
mojo       = require "mojojs"
LayoutView = require "./layoutView"

components = new bindable.Object {
  layout: new LayoutView()
}

pc.use(pcc(components));

```

template usage:

```html
{{#layout: context }}
  body
{{/}}
```
