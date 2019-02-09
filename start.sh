# start.sh
osascript -e 'tell application "System Events" to key code 144 using command down'
echo "--- Target Display Mode Started......."
/usr/local/bin/blueutil -p 0
echo "--- iMac Bluetooth off..."
exit