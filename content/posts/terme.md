---
title: Creating a POC terminal emulator  
date: 2023-12-03T22:07:22+05:30
---
 
# what is a terminal emulator?  
the thing that appears when you press `ctrl shift t` on a linux system, maybe xterm, maybe konsole, maybe st etc. so basically in the olden days there were these gigantic machines, (computer), and talking to it requires you to enter commands on [teletype](https://en.wikipedia.org/wiki/Teleprinter) (this is from where term `tty` come, more later) and the output gets printed on a sheet of paper. watch [this](https://www.youtube.com/watch?v=2XLZ4Z8LpEE) amazing video for an idea, at least the last part.  
  
but those days are no more. now most of the screens you see on a computer is a GUI. but still there is a major requirement for TUI, or somewhere you can enter a command and get a output. that is terminal emulators. why 'emulators'? because GUI itself is mostly a process running on a shell. don't believe me? try cycling through `ctrl alt f1`, `ctrl alt f2`, `ctrl alt f3` and so on. you will see the command prompt like things, and one of these will be running your X server.

these are called `tty`s, like `tty1`, `tty2` etc. what we want is now, to use these `tty` like interfaces in your X server (GUI). ie. terminal emulators

# how to build one?
now in linux, there are something called pseudoterminals, which help us make terminal emulators. what are pseudoterminals? they are these devices on linux, on which you can write commands, and read output from there. they follow the master-slave architecture, and in general, how it works is, you write a command to the master file, that command is read by a shell process attached to a slave file, that shell process runs the specific command and write its output in the same slave file, then this output is copied to master file, and finally you can read the output from master file.

enough for the theory. lets get building. `man pts` will show almost everything you need to know. so the whole process is simple, and in words:

- open master file, generally `/dev/ptmx`, you will get a file descriptor (call it master file descriptor)
- pass this master file descriptor to `ptsname()` to get a slave file path
- run the  `grantpt()` and `unlockpt()` functions on master file descriptor
- open the slave file and get a slave file descriptor
- fork a child process, redirect its I/O control to slave file, and replace the process with a shell
- in the main process. write commands, and read output from master file

last step is where you can get creative, create a GUI window, to make this reading and writing of commands, or proxy these things through a web server, and get a _terminal website_ . but in [my example](https://github.com/deprov447/terme), i did nothing of this sort. simply wrote a single command `whoami`, read its output, and printed it to stdio.

that's it, that's your poc terminal ready. just note that pseudoterminals did a lot of [heavy lifting]((https://linux.die.net/man/7/pty)) for you.

