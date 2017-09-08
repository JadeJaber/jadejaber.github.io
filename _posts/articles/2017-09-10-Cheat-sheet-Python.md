---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - python
  - cheat sheet
---
## Magic Commands

|Command|Description|
|---|---|
|%quickref|Display the IPython Quick Reference Card|
|%magic|Display detailed documentation for all of the available magic commands|
|%debug|Enter the interactive debugger at the bottom of the last exception traceback|
|%hist|Print command input (and optionally output) history|
|%pdb|Automatically enter debugger after any exception|
|%paste|Execute pre-formatted Python code from clipboard|
|%cpaste|Open a special prompt for manually pasting Python code to be executed|
|%reset|Delete all variables / names defined in interactive namespace|
|%page OBJECT|Pretty print the object and display it through a pager|
|%run script.py| Run a Python script inside IPython|
|%prun statement| Execute statement with cProfile and report the profiler output|
|%time statement| Report the execution time of single statement|
|%timeit statement|Run a statement multiple times to compute an emsemble average execution time. Useful for timing code with very short execution time|
|%who, %who_ls, %whos| Display variables defined in interactive namespace, with varying levels of information / verbosity| 
|%xdel variable|Delete a variable and attempt to clear any references to the object in the IPython internals|

## Interacting with the Operating System

|	Command 	|	Description 	|
|	---	|	---	|
|	!cmd	|	Execute cmd in the system shell	|
|	output = !cmd args 	|	Run cmd and store the stdout in output	|
|	%alias alias_name cmd 	|	Define an alias for a system (shell) command	|
|	%bookmark	|	Utilize IPython’s directory bookmarking system	|
|	%cd directory	|	Change system working directory to passed directory	|
|	%pwd	|	Return the current system working directory	|
|	%pushd directory	|	Change to directory popped off the top of the stack	|
|	%popd	|	Place current directory on stack and change to target directory 	|
|	%dirs	|	Return a list containing the current directory stack	|
|	%dhist	|	Print the history of visited directories	|
|	%env 	|	Return the system environment variables as a dict 	|