==========================
Retheme OSX Terminal tabs via SSH
==========================

If you've ever managed multiple servers via SSH, you've probably accidentally
send the wrong command to the wrong terminal window at one point or another.

This is easy to do. They all look the same! You can set the terminal prompts, 
but that's not a very good visual indicator. 

The OSX terminal app provides the ability to have multiple themes, and these 
can provide a clear visual indication, if you remember to set them. But if it's 
not automatic, you're likely to forget. 

This set of scripts was written to provide a way to run automated commands at 
the start and end of SSH sessions, based on the host name. 

Before starting an SSH session, the script will check for the existence of a script 
at ~/.ssh/scripts/start_<ssh hostname>.sh, and run it if it exists. At the end of the 
session, it will look for a script at ~/.ssh/scripts/stop_<ssh hostname>.sh, and run that
as well. Note that the hostname is based on the command line you give to SSH, so if you
nickname your servers in your SSH config, name your scripts based on the nickname rather
than the real host name.

*Linux Users*: The example scripts use an Applescript to set the terminal theme, but 
you can achieve a similar affect using the 'tput' command.

The components: 

|scripts/	| The scripts folder should be placed at ~/.ssh/scripts |
|   changetheme.scpt | An Applescript to retheme the currently active terminal tab |
|   wrapssh.sh | This bash script should be aliased to 'ssh'. It will wrap the ssh call and run your commands at start and stop. |
|   start*.sh | Example script for changing themes for integration and production environments |
|   stop.sh | Example script for changing the theme back |

==========================
Installing
==========================

1. Create some themes to use in your terminal settings. The example scripts expect to use 
	"Pro" (a default in OSX), "Pro Int", and "Pro Prod"
	
2. Install the 'scripts' folder in ~/.ssh/scripts

3. Write start and stop scripts for your server, or symlink to the example scripts. 
<code>
ln -s ~/.ssh/scripts/startprod.sh ~/.ssh/scripts/start_productionserver.mydomain.com.sh
ln -s ~/.ssh/scripts/stop.sh ~/.ssh/scripts/stop_productionserver.mydomain.com.sh
</code>


4. Test your setup by calling the wrapssh.sh script
<code>
ln -s ~/.ssh/scripts/wrapssh.sh user@productionserver.mydomain.com
</code>

5. Edit your ~/.bash_profile to call wrapssh.sh whenever you type 'ssh'. Feel free to give it 
another alias if you're squeamish about totally wrapping your SSH command.
<code>
alias ssh=~/.ssh/scripts/wrapssh.sh
</code>

*Note*: if your SSH command is aliased to the wrapssh script, it won't work for STDIN handling (as in piping things to SSH). 
I don't find this to be an issue, but if you do a lot of that in your workflow, you can alias the command to something else, or 
directly call /usr/bin/ssh when you need to pipe through SSH.