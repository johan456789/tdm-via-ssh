# tdm-via-ssh
Target Display Mode via SSH

Slightly modified from http://aaronrutley.com/target-display-mode-via-ssh/

## Installation

### iMac:

1. Move all files in ~/tdm/

2.  `brew install blueutil`

### MacBook:

* create alias (by pasting into ~/.bash_profile)

  ```bash
  # imac target display mode function
  alias imac='function _imac(){
  	if [ $1 = "start" ]; then
  		echo "--- MacBook Bluetooth on...";
  	    blueutil -p 1;	
  		sleep 1;
  		echo "--- Connecting to iMac via ssh...";
  		ssh -2 -p 22 johan@johans-imac.local sh ~/tdm/start.sh;
  	fi
  	if [ $1 = "end" ]; then
  		echo "--- MacBook Bluetooth off...";
  		blueutil -p 0;
  		sleep 1;
  		echo "--- Connecting to iMac via ssh...";
  		ssh -2 -p 22 johan@johans-imac.local sh ~/tdm/end.sh;
  	fi
  	if [ $1 = "shutdown" ]; then
  		echo "--- MacBook Bluetooth off...";
  		blueutil -p 0;
  		echo "--- Shutting down remote imac.....";
  		ssh -2 -p 22 johan@johans-imac.local sh ~/tdm/shutdown.sh;
  	fi
  	if [ $1 = "ssh" ]; then
  		echo "--- Connecting via ssh.....";
  		ssh johan@johans-imac.local;
  	fi
  };_imac'
  ```

  

## Usage

`imac start`: start TDM

`imac end`: end TDM

`imac shutdown`

`imac ssh`: ssh into iMac