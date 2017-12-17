
********************************
Nifty Interactive Regex Wrangler
********************************

NIRW is a convenient, command-line text search tool.

- Recursively searches from the current directly by default.
- One-off operation (search and open one of the results).
- Optionally refine within the current search.
- Highlights matches.
- Displays search progress.
- Tab auto-complete terms based on current results.
- Simple command line for more advanced filtering.
- Optional ignore-case and multi-line and literal (without regex) support.
- No configuration.


Motivation
==========

There are many ways to search text files, why add a new one?

The main reason is I didn't find any existing solutions convenient for day-to-day usage,
especially with multiple projects where I might want to launch different editors based on the language.

Previously I'd been using a shell script that wrapped ``find`` and ``pcregrep``,
it worked well but had some limitations.

The main one being that I would often want to refine the search (search within the search).

While this is possible with piping, it becomes cumbersome to keep editing the previous command.
It also doesn't work for multi-line searches.

This tool is meant to be quick and easy to perform searches, with minimum fuss.


Usage
=====

Instead of using a central configuration,
this tool is intended to be wrapped by an alias or shell-script for convenient command line access,
see ``examples/bin``.

This allows you to setup commands, typically one per language.

Results are enumerated, typing a number opens the match and exists.

Otherwise you can type in terms to further refine your search or press ``?`` for help.

To see available command line options when executing the search command use ``--help``.

Regex expressions are used unless the ``--literal`` option is passed
(`see docs <https://docs.python.org/3.6/library/re.html>`__).


Example Wrapper
---------------

At a minimum a wrapper must set the ``--include-files`` and ``--editor`` arguments,
typically this is all thats needed unless you want to change the default behavior.

Example of a simple ``*.txt`` file searcher::

   #!/bin/sh
   exec nirw-search \
       --include-files ".+\.txt$" \
       --editor "gvim '+cal cursor({line},{column})' {file}" \
       "$@"


Example Usage
-------------

For example, you could use ``prep`` for Python, ``crep`` for C/C++ and ``cmrep`` for CMake files.

Then you can search C source files by typing::

   crep "some text"

To search for multiple occurrences (in any order) simply separate the arguments::

   crep some text

For case insensitive searches::

   crep -i "other text"

For multi-line searches::

   crep -M "new\nline"

For literal searches::

   crep --literal "if (a > c - b[0]) {"

Multi-line import search in Python::

   prep -M "from\s+my_module\s+import\s+\([^\)]*\)"


Help Text
=========

For typical usage you should not be entering a long list of command-line arguments,
nevertheless there are times where you may want to change the default behavior.

.. BEGIN HELP TEXT

Output of ``nirw-search --help``

usage::

       nirw-search [-h] --editor EDITOR_COMMAND [--persistent] [--index-zero]
                   [--search-path SEARCH_PATH] --include-files INCLUDE_FILES
                   [--exclude-files EXCLUDE_FILES] [--literal] [-i] [-M]
                   [--color <auto,always,never>] [--color-reverse]
                   [--progress <auto,always,never>]
                   [search [search ...]]

NIRW - nifty interactive regex wrangler.

positional arguments:
  search
                        Text to search files for
                        (must be a regular expression unless ``--literal`` is passed).

                        When multiple search arguments are passed,
                        the results must match all (in any order).

                        When no search terms are given ``--persistent`` mode is enabled
                        so you can perform multiple searches.

optional arguments:
  -h, --help            show this help message and exit
  --editor EDITOR_COMMAND
                        Command used to edit file and arguments
                        which will be passed to the editor:
                        ``{file}``, ``{line}``, ``{column}`` will be replaced
                        with the file-name, line number and column respectively.
  --persistent          Stay open after selecting a file,
                        pressing Ctrl-C resets a new search instead of exiting,
                        pressing twice exits.
  --index-zero          Start indices at zero instead of one.

filepath matching arguments:
  These options control which files are selected to be searched.

  --search-path SEARCH_PATH
                        Path to search in, defaults to "." when not passed.
  --include-files INCLUDE_FILES
                        Case insensitive regular expression matched against each file,
                        only search files that pass.
  --exclude-files EXCLUDE_FILES
                        Case insensitive regular expression matched against each file,
                        only search files that fail. Defaults to "\." (skip hidden files).

expression matching arguments:
  These options control how matching is performed

  --literal             Search for the literal string
                        instead of interpreting as a regex expression
                        (only applies to arguments passed in via the command line).
  -i, --ignore-case     Case insensitive search.
  -M, --multiline       Multi-line search.

display arguments:
  Control the search output.

  --color <auto,always,never>
                        Color highlight matches.
  --color-reverse       Inverse highlight color (for improved white space highlighting).
  --progress <auto,always,never>
                        Display the file currently being searched.

Typically this should be executed by a wrapper or shell alias.

command line options:
  Keys:

  - Quit:       Ctrl-C
  - Re-display: Ctrl-D

  Special Input:

  - ``?``:    Show the help message.

  Filter Commands:

  - ``:f    Text``    - filters on text
  - ``:p    Text``    - filters on path
  - ``:fr   Text``    - filters on text with regex.
  - ``:pr   Text``    - filters on path with regex.

  Adding a '-' character immediately after the command masks matches out.

  eg::

     :f- Foo

  Remove all lines containing 'Foo'.

  Other Commands:

  - ``:u``    Undoes the last filter command.

.. END HELP TEXT


TODO
====

- Support printing filename once above all matches.
- Multi-processing for regex matching.
- Configurable encoding (currently only utf-8).
- Tests.
