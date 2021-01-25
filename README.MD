# Rsyncp is a Rsync wrapper
I Add a **p** letter like **profile**, this script use a command-line profile files.
The idea is to save **rsync** paramters in many **profiles files**.

So describe in many files eatch parameters you want, and execute "rsyncp" with files names in parameters.

Example for one profile:

    $ ./rsyncp monitoring

You can execute many profiles, so many parameters:

    $ ./rsyncp.sh monitoring pyblog sport wildCodeSchool

Output example with multi profiles:

    $ ./rsyncp.sh monitoring pyblog sport wildCodeSchool
    Profile file    :  monitoring
      Major version :  v1
      Parameters    :  -a --delete --progress
      Source        :  jc@dev-machine:dev/site/monitoring
      Destination   :  /home/jc/dev/site
    receiving incremental file list

    Profile file    :  pyblog
      Major version :  v1
      Parameters    :  -a --delete --progress
      Source        :  jc@dev-machine:~/dev/site/pyblog
      Destination   :  /home/jc/dev/site
    receiving incremental file list

    Profile file    :  sport
      Major version :  v1
      Parameters    :  -a --delete --progress
      Source        :  jc@dev-machine:~/dev/sport
      Destination   :  /home/jc/dev
    receiving incremental file list

    Profile file    :  wildCodeSchool
      Major version :  v1
      Parameters    :  -a --delete --progress
      Source        :  jc@dev-machine:~/dev/WildCodeSchool
      Destination   :  /home/jc/dev
    receiving incremental file list


## Version 1: Profiles files details (2021-01-23)
### Profile file organisation:
	  Line1: Major version.
	  Line2: Rsync command-line.
  	Line3: Source folder or ssh path.
	  Line4: Destination folder or ssh path.
### Organisation example:

    v1"
    -a --delete --progress
    user@ipAddress:~/dev/site
    /home/user/dev
