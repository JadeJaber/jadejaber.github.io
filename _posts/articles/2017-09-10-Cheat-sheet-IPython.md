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

Execute juste after exception is raised
```python
> %debug
ipdb>
````

> Once inside the debugger, you can execute arbitrary Python code and explore all of the objects and data (which have been “kept alive” by the interpreter) inside each stack frame. 

```python
ipdb> u
> /home/wesm/book_scripts/ch03/ipython_bug.py(13)calling_things()
12 works_fine()
---> 13 throws_an_exception()
14
```

> Executing the %pdb command makes it so that IPython automatically invokes the de-
bugger after any exception, a mode that many users will find especially useful.

You may use %run with the -d flag, which invokes the debugger before executing any code in the passed script. You must immediately press s (step) to enter the script:
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


## Lists

### Iterable and generators

Iterable
```python
lst = [1, 2, 3]
>>> for i in lst :
...     print(i)
```

Generator
```python
st = [x*x for x in range(3)]
>>> for i in lst :
...     print(i)
```

> Genrator cannot be read again and again since it generates values on the fly


### Transform a liste

Standard transformation
```python
sequence = [element.upper() for element in sequence]
```
Mix chars and int
```python
print(['a' * nombre for nombre in sequence]) ## returns as much "a" as "nombre"  
```

Apply filters
```python
nombres = range(10)
print([nombre for nombre in nombres if nombre % 2 == 0]) ## keeps only even numbers
````

Nice one

Looser
```python
>>> nombres = range(10)
>>> sommes = []
>>> for nombre in nombres:
...     if nombre % 2 == 0:
...         somme = 0
...         for i in range(nombre):
...             somme += i
...         sommes.append(somme)
...
>>> print(sommes)
[0, 1, 6, 15, 28]
```

Intermediate
```python
>>> sommes = []
>>> for nombre in range(10):
...     if nombre % 2 == 0:
...         sommes.append(sum(range(nombre)))
...
>>> print(sommes)
[0, 1, 6, 15, 28]
```

Advanced
```python
>>> print([sum(range(nombre)) for nombre in range(10) if nombre % 2 == 0])
```

Guru
```python
>>> [sum(range(nombre)) for nombre in range(0, 10, 2)]
```