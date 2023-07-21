.. include:: ../../.default.rst

Dev Docs
========

:top: ReadMe__

.. __: /ReadMe.rst

Status
------
- <http:./tasks/todo-1.md> Build forms 1-4.

  Only basic forms 1.1 and 1.3 sort of work as template,
  form 1.2 is still hard-coded for a large part.
  Form 4 (2.1) is largely to be done yet.

- TODO-2: rewrite SDK CSS to Sass, deprecate
- TODO-3, TODO-9: play together with bootstrap, archive.is, web.archive.org
- TODO-4: reusable components; Sf+Pug/Sass JSON/YAML initially
- TODO-7: minor progress at `app ok-docs </app/ok-docs/main>`__.
  Should get sitefile lib/code to fetch raw HTML and place into content panes.

  2020-11-26 Some success letting Pug read JSON [TODO-12]
  Probably want something for Sass too. Like insert globals or vars.
  tasks/todo-12.md

- 2018-12-12 forms @Draft <var/ok-sdk/content/forms>
  Draft for OK styleguide?

  [TODO-8] Docs: place for style reference
  only have `visual guide`_ now.

- TODO-17: canon animations

  Implemented only some fading button and scrolling numbers.

  scrolling numbers:
  - shows numerical seq inputs, in static random color tint,
    resets columns randomly
  - TODO: includes indep scrolling columns
  - TODO: includes rolling highlight (ie. "row scan"),
    that may end in blinking row (ie. selection or alert)

- TODO-18: The text and numbers of one 'kodalit' graphic are reproduced:
  "SENSOR 247-059" at /forms?merge.data=repro/TNG-2369a

  No graphics, no animations. Currently sorting some colors by

  (2369 is season 6, or 46982.1 (2369).
  USS-E D is 2363 to 2371

  app/ok-sdk/style/palette/TNG-*

Plan
-----
XXX: see status and issues, need to document current/last dev focus better

Issues
-------
- After updating YAML data, the JSON will need to be regenerated.
  But local tooling is limited, gruntfile is out of use currently?

[TODO-16]
  The current CSS classes experiment with a `ok-dia:span` and `ok-dia:bar` class,
  but need another S/M/L sizing scheme for pill buttons, and other margin rules as well that are unrelated to text height/baseline/extent. But resemble a table more closely.

  Probably `ok-dia:block` medium equals `ok-dia:bar` XL or XXL.
  Look at text to find matching size.
  Probably want to match that with intra-line spacing for span/bar.

XXX: see about non-inline version of form 1.1, probably works better in complex
layouts.

Setup
------
The intention is to build some metadata driven app(s), currently using the
Sitefile server as 'framework'. The script, style and template sources for
these are beneath ``app/``, and the metadata goes into ``var/ok-sdk`` currently.

The main resources of this project web pages served by an Express.JS instance,
and the URL paths (routes) that it serves are configured through ``Sitefile.yaml``.

SASS is a powerful styling language for DOM, and after some experimentation
with the LCARS SDK CSS files, an improved method of elbow generation was
written with it. It uses an additional triangle to allow for very thin bars,
but the exact generation still needs some fix as tweaking BF-1.2 shows.

The result of this SASS may eventually become dist artefacts with some future version:

- `base.css </app/ok-sdk/style/style.sass>`_
- `base-theme.css </app/ok-sdk/style/theme.sass>`_


Tooling
--------
- ``package.y*ml`` [1__] for all project metadata (but don't forget ``package.json`` scripts)
- Sitefile [2__] to serve pages as site at HTTP (containerized)
- httrack to mirror static copy for <pages.github.com> (see ``mirror.sh``)
- Grunt CLI.

.. __: https://github.com/dotmpe/script-mpe/blob/dev/package.rst
.. __: https://github.com/dotmpe/node-sitefile

Directories
-----------
::

  app                Sources for HTML app(s) and Sitefile extensions
  doc                All marked up text files
  └── dev            Where this document is, not much to it
  lib                Third party
  └── lcars-sdk      Original webview LCARS SDK
  public
  └── media          Static media data directory (see Sitefile's route mapping)
  tasks              Additional scripts Grunt(file) builder
  var                Data files
  ├── ok-sdk         Variable data for local app
  └── node-sitefile  Additional data for sitefile server

.. Id: OK-SDK:doc/dev/main.rst
