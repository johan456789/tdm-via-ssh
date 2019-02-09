# end.sh 
/usr/local/bin/blueutil -p 1 
echo "--- iMac Bluetooth on..."
echo "Connecting Bluetooth keyboard..."
sleep 7
echo "--- Target Display Mode command..."
osascript -e 'tell application "System Events" to key code 144 using command down'
echo "--- Target Display Mode Ended......."
exit