@TODO:12 combine YAML with Pug to render diagrams

# Status: initial implementation
* Using YAML for convenience, and Grunt to convert files.
* Letting Pug access JSON docs directly. No special Sf router.
- Cannot currently handle relative path references within `$include` and `$ref` very well, but I don't care.

# Further thoughts
- Maybe parse markdown to JSON somehow.
* Although Sf context is available it is still unused. Would be good idea to rewrite some Pug embedded Javascript into Sf context extension.
