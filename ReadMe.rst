.. include:: .default.rst

OK! LCARS SDK |badges|
======================
:version: 0.0.4-dev `release notes`_

An investigation and demonstration creating `okudagrams` for WebView (Android)
and anything (Chrome et al.) that can do modern HTML/CSS rendering.

This is based on the original work from `LCARS-SDK`__, which has some big
advantages over other methods of LCARS generation.

- No need for Flash, Java or other embedded software.
- No need to prepare vector images. Ie. export static illustrations and load in
  Flash, SVG, etc.

- Still has/can do a fully scalable interface, potentially could do so called
  'responsive' adaptive layouts.

- re-uses all of the HTML DOM and CSS specs; scripting, security, development
  tools.

- runs on every? modern consumer OS.

The ultimate goal would be some sort of multi-screen app, where a multihead or
even multihost system would run dedicated displays on different monitors.
However, the focus for this project is on fooling around, and playing with (a)
certain type(s) of LCARS rendering.

I don't have a lot of time for this project, but


Contents
--------
See CHANGELOG_ for committed updates per version.

- [...] indicate (past) dates and other Id references.
- (...) indicate priorities, and future dates and tasks.

A bit of project background is given in `Why?`_, but there isn't a lot of
documentation and as typical for a web app there are *a lot of source files*.

To get around, have a look at the following text files.
Or just jump to Quickstart_ to try and see what it does.

- [doc/dev] For technical details, current tasks and focus see `Dev Docs`_.
- [doc/dev/log] CHANGELOG_ holds the bullet-point summaries of changes per
  release, but details may be in Dev Docs `log <doc/dev/log.rst>`_ as well.
- [ReadMe#Plan] The current and intended release schema and timeline is below.
- ``TODO.txt`` should hold a line for every concrete task


Quickstart
----------
I'm sorry but there isn't a currently recommended command *in particular*. If
there is any feedback on GitHub I could tailor one. But until then, currently,
you may try using an (aging) ``dotmpe/node-sitefile`` docker image in either a
production or development setup (what I personally use).

To do this you need

- a running `docker` install, that can mount some specific local paths
- for dev, an SSH key authorized with a GitHub account

Now the container is recreated using either::

  # Checkout latest version of this project inside Sf container
  ./run.sh

  # Mount local checkout into Sf container
  gh_keyfile=<path to SSH key for GH account> ./run-dev.sh

which should produce a server on ``<local hostname>:7010``
or ``<local hostname>:4508`` for dev respectively.

There are no further management scripts for this container. To remove it
manually use::

  docker rm -f sf-ok-lcars-sdk{,-dev}


Plan
----
0.0 (current)
  - Testing CSS capabilities, orientation on plan [TODO-1]
  - Sitefile client integration
  - Setup for different require.js apps.

0.1 [someday...]
  - Pug+Sass based toolkit used with Sitefile, later with standalone/other tools.
  - LCARS SDK docs & reference, style guide etc. [TODO-8]
    If possible with format1, else with full Pug data struct in JSON/YAML.
  - The most basic animated follies: scrolling numbers, polarized fade, button blink/fade.

0.x
  - TODO-3: bootstrap
  - TODO-6: ``run.sh``
  - Standalone generator with CLI and only essential NPM deps.

1.x
  - Responsive pages; with phone, tablet, laptop and HD display profiles.
  - Multi-display/page views [TODO-5]

x.x
  - WebComponent elements [TODO-4]


See Also/More
-------------
- The online version of this project at `github pages`__.

  This is actually a static snapshot, and I have not fixed it to capture
  `require.js` requests so those dynamic parts will be missing.
  It will probably never work for apps with dynamic server side parts, but
  capturing some static placeholders instead may be possible.

- The original `LCARS SDK site`__, and `LCARS SDK wiki`__  docs by ~Aric as well
  as the `LCARS SDK source`__.

.. references:
.. __: http://web.archive.org/web/20181120182819/http://lcarssdk.org/
.. __: https://dotmpe.github.io/ok-lcars-sdk
.. __: http://www.aricwithana.me/lcars-sdk
.. __: https://github.com/Aricwithana/LCARS-SDK/wiki
.. __: https://github.com/Aricwithana/LCARS-SDK

.. badge images:
.. |badges| replace:: |badge-ci| |badge-code-size| |badge-repo-size| |badge-activity|
.. |badge-ci| image:: http://img.shields.io/travis/dotmpe/ok-lcars-sdk.svg
   :target: https://travis-ci.org/dotmpe/ok-lcars-sdk
   :alt: CI build status
.. |badge-code-size| image:: https://img.shields.io/github/languages/code-size/dotmpe/ok-lcars-sdk.svg
   :alt: code size
.. |badge-repo-size| image:: https://img.shields.io/github/repo-size/dotmpe/ok-lcars-sdk.svg
   :alt: repo size
.. |badge-activity| image:: https://img.shields.io/github/commit-activity/y/dotmpe/ok-lcars-sdk.svg
   :alt: commits per year

.. Id: OK-SDK:ReadMe.rst
