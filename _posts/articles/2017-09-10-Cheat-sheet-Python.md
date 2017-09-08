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


## Interactive Debugger

```python
ipdb>
```
Once inside the debugger, you can execute arbitrary Python code and explore all of the objects and data (which have been “kept alive” by the interpreter) inside each stack frame. By default you start in the lowest level, where the error occurred. By pressing u (up) and d (down), you can switch between the levels of the stack trace:
```python
ipdb> u
> /home/wesm/book_scripts/ch03/ipython_bug.py(13)calling_things()
12 works_fine()
---> 13 throws_an_exception()
14
```
Executing the %pdb command makes it so that IPython automatically invokes the de-
bugger after any exception, a mode that many users will find especially useful.
It’s also easy to use the debugger to help develop code, especially when you wish to set breakpoints or step through the execution of a function or script to examine the state at each stage. There are several ways to accomplish this. The first is by using %run with the -d flag, which invokes the debugger before executing any code in the passed script. You must immediately press s (step) to enter the script:
```python
In [5]: run -d ch03/ipython_bug.py
Breakpoint 1 at /home/wesm/book_scripts/ch03/ipython_bug.py:1 NOTE: Enter 'c' at the ipdb> prompt to start your script.
> <string>(1)<module>()
ipdb> s
--Call--
> /home/wesm/book_scripts/ch03/ipython_bug.py(1)<module>() 1---> 1 def works_fine():
2 a=5
3 b=6
```


|	Command 	|	Action 	|
|	---	|	---	|
|	h(elp)	|	Display command list	|
|	help command	|	Show documentation for command	|
|	c(ontinue)	|	Resume program execution	|
|	q(uit)	|	Exit debugger without executing any more code	|
|	b(reak) number	|	Set breakpoint at number in current file	|
|	b path/to/file.py:number 	|	Set breakpoint at line number in specified file	|
|	s(step)	|	Step into function call	|
|	n(ext)	|	Execute current line and advance to next line at current level 	|
|	u(p) / d(down)	|	Move up/down in function call stack	|
|	a(rgs)	|	Show arguments for current function	|
|	debug statement	|	Invoke statement statement in new (recursive) debugger 	|
|	l(ist) statement	|	Show current position and context at current level of stack	|
|	w(here) 	|	 Print full stack trace with context at current position 	|