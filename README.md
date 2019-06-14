# matkey
Windows User Management Script / Automation of the chntpw pool 

Common Issue: If Windows is in hibernation mode, chntpw will not be able to modify Windows users. Booting up the windows partition and restarting it may take Windows out of hibernation and vulnerable.



=====USAGE=====

+Boot into a drive to wear you are able to mount the target windows partition (USB Bootable or other drive)

+Ensure chntpw is installed for use with script

+If no partitions are displayed when running matkey, you may want to run a partition manager to determine which partition for matkey to target
