.. include:: ../../.default.rst

Dev Docs
========

Status
------
- TODO-1: See how far HTML/CSS concept can be applied to okudagrams, before
  much of anything else. See `Form 2.1 (4) </base-form-4>`__.
- TODO-7: minor progress at `app ok-docs </app/ok-docs/main>`__.
  Should get sitefile lib/code to fetch raw HTML and place into content panes.
- TODO-8: only have `visual guide`_ now.


Setup
-----
- Initial source in SASS and PUG
- SASS provides some styling parallel to classes provided by LCARS SDK,
  but no import or local okudagrams elements yet
- Four layout experiments, three go fairly well with above

Tooling
-------
- ``package.y*ml`` [1__] for all project metadata (but don't forget package.json scripts)
- Sitefile [2__] to serve site at HTTP (containerized)
- httrack to mirror static copy for <pages.github.com>

Directories
-----------
::

  app            Source for HTML app(s) and Sitefile extensions
  doc            All marked up text files
  └── dev        Where this document is, not much to it
  lib            Third party
  └── lcars-sdk  Original webview LCARS SDK

.. __: https://github.com/bvberkum/script-mpe/blob/dev/package.rst
.. __: https://github.com/bvberkum/node-sitefile
