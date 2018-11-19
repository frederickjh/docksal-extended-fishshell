# docksal-extended-fishshell
Files needed to add Fish (Friendly Interactive SHell) to the cli container in Docksal

Note: The base folder in this repository is `docksal` so that the project files are not hidden by default. In your Docker installation this is the equivelant to your `.docksal` folder and these files should be placed in relation to it in your Docksal directory tree.

The `.docksal` folder is in your $HOME directory. ie. `/home/username/.docksal`

`docksal-fishshell.yml` gives an example on how to set up Fish in your Docksal project by extending the Docksal cli container.

There is also a `fin`  command included to start Fish in the cli `fin fish`.

Currently this repository is a quick dump of my extension for the Docksal developer and any one else interested in:

1. Adding Fish to the cli in Docksal
2. An example of how to extend the Docksal cil container

Notes:

1. fishshellconfiglink - Allow users to transfer Fish configuration files to the cli container
1. fishermanconfig - Adds a link to the fisherman files to allow the user to change to a fisherman Fish configuration
1. fishshellconfig - Default Fish configuration. Note some of the functions in here are ones I use and do not need to be included to have this work
1. Fish functions starting with `__` are hidden and used by the system to do setup tasks.
1. I was trying to setup a default Fish configuration for myself but also allow using Fisherman to allow users to quickly setup their own.
1. This is working for me and I created it a while ago. In some regards I am uncertain why I did some things the way I did. Like why are there `fishshellconfig` and `fishshellconfiglink` folders? Could they not combined? Should `fishermanconfig` be a sub-folder of one of the others?
