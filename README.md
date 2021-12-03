# README

It's just a collection of solutions to coding problems
on some well-known online judge platforms or contests.
Use _Makefiles_ to automate compilation, 
see _Makefile_ and _branch.mk_ for more information.

The solutions are based on a library 
inspired by _C interfaces and implementations_,
and wrote in literate program form.

Maintainance of infrastructure and solving of problems
are separated to different branches,
to clone the infrastructure separately is possible,
check out branch _infra_ if you want.

## Usage

I hope that the code could explain itself, but it failed to do that, apparently.
Two kinds of _Makefile_ are used, one in root directory
(The _Makefile_ in current directory), one in sub-directories(_branch.mk_).

If you are at root, the following targets are supported.
```
# create a new folder, then, 
# create a symbol link of branch.mk in that folder
$ make new 

# recreate symbol links in all branch directories, 
# which specified by PLATFORMS macro in Makefile
$ make refresh 

# delete all temporary files and symbol links
$ make clean
```

If you are at branch,
```
# create a new file, and edit it with editor, 
# which can be specified by ${EDITOR} in branch.mk,
# but to state it as an environment variable is recommended,
# some other programs(for example, visudo) also use $EDITOR.
$ make new

# create a new folder,
# the same as "make new" at root
$ make new-folder

# delete all temporary files
$ make clean
```

