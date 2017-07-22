
********************************
Nifty Interactive Regex Wrangler
********************************

NIRW is a hackable text searching tool.

- Recursively searches from the current directly by default.
- One-off operation (search and open one of the results).
- Optionally refine within the current search.
- Highlights matches.
- Tab auto-complete terms based on current results.
- Simple command line for more advanced filtering.
- Optional ignore-case and multi-line and literal (without regex) support.
- No configuration.


Usage
=====

Instead of using a central configuration,
this tool is intended to be wrapped by an alias or shell-script for convenient command line access,
see ``examples/bin``.

This allows you to setup commands, typically one per language.

Results are enumerated, typing a number opens the match and exists.

Otherwise you can press ``?`` to see how you can refine your search.

To see available command line options when executing the search command use ``--help``.

Regex expressions are used unless the ``--literal`` option is passed
(`see docs <https://docs.python.org/3.6/library/re.html>`__).


Help Text
---------

For typical usage you should not be entering a long list of command-line arguments,
nevertheless there are times where you may want to change the default behavior.

.. BEGIN HELP TEXT

Output of ``nirw-search --help``::

   usage: nirw-search [-h] --editor EDITOR_COMMAND --include-files INCLUDE_FILES
                      [--search-path SEARCH_PATH] [--persistent] [--literal] [-i]
                      [-M] [--color {auto,always,never}]
                      [search [search ...]]

   NIRW - nifty interactive regex wrangler.

   positional arguments:
     search

   optional arguments:
     -h, --help            show this help message and exit
     --editor EDITOR_COMMAND
                           Command used to edit file and arguments which will be
                           passed to the editor: {file}, {line}, {column} will be
                           replaced with the file-name, line number and column
                           respectively.
     --include-files INCLUDE_FILES
                           Regular expression matched against each file, only
                           search files that pass.
     --search-path SEARCH_PATH
                           Path to search in, defaults to "." when not passed.
     --persistent          Stay open after selecting a file.
     --literal             Search for the literal string instead of interpreting
                           as a regex expression (only applies to arguments
                           passed in via the command line).
     -i, --ignore-case     Case insensitive search.
     -M, --multiline       Multi-line search.
     --color {auto,always,never}
                           Use color.

   Typically this should be executed by a wrapper or shell alias.'

   command line options:

     Usage

     Keys::
     * Quit:       Ctrl-C
     * Re-display: Ctrl-D

     Special Input::
     * ?:    Show the help message.

     Filter Commands::
     * :f    Text    - filters on text
     * :p    Text    - filters on path
     * :fr   Text    - filters on text with regex.
     * :pr   Text    - filters on text with regex.

     Note that adding a '-' character immediately after the command masks matches out.
     eg:
        :f- Foo
     Remove all lines containing 'Foo'.

     Other Commands::

     * :u    Undoes the last filter command.


.. END HELP TEXT


Examples
========

For example, you could use ``prep`` for Python, ``crep`` for C/C++ and ``cmrep`` for CMake files.

Then you can search C source files by typing::

   crep "some text"

For case insensitive searches::

   crep -i "other text"

For multi-line searches::

   crep -M "new\nline"

For literal searches::

   crep --literal "if (a > c - b[0]) {"


TODO
====

- Multi-processing for regex matching.
- Configurable encoding (currently only utf-8).
