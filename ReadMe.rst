.. include:: .default.rst

OK! LCARS SDK |badges|
======================
:version: 0.0.3-dev `release notes`_

An investigation and demonstration creating `okudagrams` for WebView (Android)
and anything that can do modern HTML/CSS rendering.

This is based on the original work from `LCARS-SDK`__, which has some big
advantages over other methods of LCARS generation.

- No need for Flash, Java or other embedded software.
- No need to prepare vector images. Ie. export static illustrations and load in
  Flash, SVG, etc.

- Still has/can do a fully scalable interface, potentially could do
  Bootstrap-style responsive classes.

- re-uses all of the HTML DOM and CSS specs; scripting, security, development
  tools.

- runs on every? modern consumer OS. And by using modern web-technologies can
  be built into any kind of client/server, multi-screen, multi-user app as
  required.

Contents
--------
See CHANGELOG_ for committed updates per version, and ``TODO.txt`` for tasks.
A bit of project background is given in `Why?`_.

Intended release schema/timeline below, for technical details, and current tasks and focus see `Dev Docs`_.

Plan
----
0.0
  - Testing CSS capabilities, orientation on plan [TODO-1]
  - Sitefile client integration
  - Setup for different require.js apps.

0.1 [end of 2020]
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
