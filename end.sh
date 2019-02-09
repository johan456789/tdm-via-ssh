# end.sh 
blueutil on
echo "--- iMac Bluetooth on..."
sleep 5
echo "--- Target Display Mode command..."
osascript -e 'tell application "System Events" to key code 144 using command down'
echo "--- Target Display Mode Ended......."
exit