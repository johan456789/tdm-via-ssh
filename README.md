# tdm-via-ssh
Target Display Mode via SSH

Slightly modified from http://aaronrutley.com/target-display-mode-via-ssh/

## Installation

### iMac:

1. Move all files in ~/tdm/

2.  `brew install blueutil`

3. Set up permissions:
   - System Preferences > Sharing > Remote Login ☑
   - You will also need to give some apps accessibility access (Security & Privacy > Privacy > Accessibility). Can add it after you run the code.

### MacBook:

* create alias (by pasting into ~/.bash_profile)

  - username: the user you're logging into iMac
  - hostname: the iMac's name (run `hostname` in iMac's terminal to get it)
  - after adding the below code, `source ~/.bash_profile` to take effect

  ```bash
  # imac target display mode function
  alias imac='function _imac(){
  	if [ $1 = "start" ]; then
  		echo "--- MacBook Bluetooth on...";
  	    blueutil -p 1;	
  		sleep 1;
  		echo "--- Connecting to iMac via ssh...";
  		ssh -2 -p 22 username@hostname.local sh ~/tdm/start.sh;
  	fi
  	if [ $1 = "end" ]; then
  		echo "--- MacBook Bluetooth off...";
  		blueutil -p 0;
  		sleep 1;
  		echo "--- Connecting to iMac via ssh...";
  		ssh -2 -p 22 username@hostname.local sh ~/tdm/end.sh;
  	fi
  	if [ $1 = "shutdown" ]; then
  		echo "--- MacBook Bluetooth off...";
  		blueutil -p 0;
  		echo "--- Shutting down remote imac.....";
  		ssh -2 -p 22 username@hostname.local sh ~/tdm/shutdown.sh;
  	fi
  	if [ $1 = "ssh" ]; then
  		echo "--- Connecting via ssh.....";
  		ssh username@hostname.local;
  	fi
  };_imac'
  ```

* SSH into iMac without password:

  - Snippet from: https://danielpataki.com/target-display-mode-remotely/

  ```bash
  # when you issue the following command you'll be asked some questions, keep hitting enter until done.
  ssh-keygen
  scp ~/.ssh/id_rsa.pub username@hostname.local:~/
  ssh username@hostname.local
  mkdir .ssh
  cat id_rsa.pub >> ~/.ssh/authorized_keys
  rm -f id_rsa.pub
  exit
  ```

## Usage

`imac start`: start TDM

`imac end`: end TDM

`imac shutdown`

`imac ssh`: ssh into iMac
