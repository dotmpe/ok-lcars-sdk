Version 0.0.4-dev

The LCARS SDK project has a lot of elements already. I'd like to build a few layouts, but I wasn't sure about the JS API. And I did not want to write HTML directly. Also I was not entirely happy with the CSS setup. So I started with Pug and Sass to explore the setup.

At v0.0.3 that was mostly written to be a server-side, JSON driven setup. Meanwhile SDK v4 was released with some restructuring and more JS API, but I cannot get the style guide ported and working. So instead stucking to old LCARS SDK release.

I wrote some inline bar CSS and preliminary inline-box, and am experimenting with sizing schemes. With SASS it is easy to generate different class-selector setups. I would really want to integrate with the SDK css, but there's a few things about the current setup I don't like. Such as a lot of "reset" CSS messing with basic HTML layout.

Most layout are now generated from YAML, which in the future I hope to extend to more flexible document rendering.
