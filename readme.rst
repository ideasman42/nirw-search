
********************************
Nifty Interactive Regex Wrangler
********************************

NIRW is a hackable text searching tool.

- Recursively searches from the current directly by default.
- One-off operation (search and open one of the results).
- Optionally refine within the current search.
- Tab auto-complete terms based on current results.
- Simple command line for more advanced filtering.
- Optional ignore-case and multi-line support.


Usage
=====

Instead of using a central configuration,
this tool is intended to be wrapped by an alias or shell-script for convenient command line access,
see ``examples/bin``.

This allows you to setup commands, typically one per language.

Results are enumerated, typing a number opens the match and exists.

Otherwise you can press '?' to see command line options.

Regex expressions are supported (`see docs <https://docs.python.org/3.6/library/re.html>`__).


Examples
========

For example, you could use ``prep`` for Python, ``crep`` for C/C++ and ``cmrep`` for CMake files.

Then you can search C source files by typing::

   crep "some text"

For case insensitive searches::

   crep -i "other text"

For multi-line searches::

   crep -M "new\nline"


TODO
====

- Color matches.
- Multi-processing for regex matching.
- Configurable encoding (currently only utf-8).
