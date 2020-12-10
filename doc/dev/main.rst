.. include:: ../../.default.rst

Dev Docs
========

Status
------
- tasks/todo-1.md Build forms 1-4.
- TODO-2: rewrite SDK CSS to Sass, deprecate
- TODO-3, TODO-9: play together with bootstrap, archive.is, web.archive.org
- TODO-4: reusable components; Sf+Pug/Sass JSON/YAML initially
- TODO-7: minor progress at `app ok-docs </app/ok-docs/main>`__.
  Should get sitefile lib/code to fetch raw HTML and place into content panes.

  2020-11-26 Some success letting Pug read JSON [TODO-12]
  Probably want something for Sass too. Like insert globals or vars.
  tasks/todo-12.md

- 2018-12-12 @Draft var/ok-sdk/content/forms
  Draft for OK styleguide
  [TODO-8] Docs: place for style reference
  only have `visual guide`_ now.

Setup
-----
- SASS provides some styling parallel to classes provided by LCARS SDK,
  but no import or local okudagrams elements yet
- Four layout experiments, three go fairly well with above

Tooling
-------
- ``package.y*ml`` [1__] for all project metadata (but don't forget ``package.json`` scripts)
- Sitefile [2__] to serve pages as site at HTTP (containerized)
- httrack to mirror static copy for <pages.github.com> (see ``mirror.sh``)
- Grunt CLI.

Directories
-----------
::

  app            Source for HTML app(s) and Sitefile extensions
  doc            All marked up text files
  └── dev        Where this document is, not much to it
  lib            Third party
  └── lcars-sdk  Original webview LCARS SDK

.. __: https://github.com/dotmpe/script-mpe/blob/dev/package.rst
.. __: https://github.com/dotmpe/node-sitefile

.. Id: OK-SDK:doc/dev/main.rst
