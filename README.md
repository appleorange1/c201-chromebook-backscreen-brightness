# c201-chromebook-backscreen-brightness
Modifiy the brightness of the C201 Chromebook

# Instructions
This script allows you to get and set the brightness of a C201 Chromebook.
It probably works with other devices which use the same GPU, but I made this
in a hurry, and I didn't have time to find out the details. I think it's a Mali
GPU for what it's worth.

It is written in for the Dash shell, so should work with Bash and many other
shells, although I have not tested it with these.

# Getting the brightness

$ ./brightness.sh

# Setting the brightness

$ ./brightness.sh <brightness>

where brightness is a number between 0 and 255.

The first time you run the set script, every time you turn on your computer,
you need to run it as root to change the permissions on the brightness file.
