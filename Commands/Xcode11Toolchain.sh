#!/bin/bash

PS3='Choose an option: '
xcode=("Install Xcode 11 toolchain" "Revert back to Xcode 12 toolchain")
select fav in "${xcode[@]}"; do
    case $fav in
        "Install Xcode 11 toolchain")
echo "Renaming Xcode 12 toolchain"
sudo mv /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault-12.xctoolchain
cd
echo "Done"

echo "About to install Xcode 11 toolchain"
sleep 2

cd /Applications/Xcode.app/Contents/Developer/Toolchains
echo "Installing Xcode 11 toolchain"
sudo git clone https://github.com/nahtedetihw/Xcode11Toolchain
echo "Done"
cd
;;

"Revert back to Xcode 12 toolchain")
rm -r /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
echo "Deleted Xcode 11 toolchain"
sleep 2
cd

echo "Now restoring Xcode 12 toolchain"
sudo mv /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault-12.xctoolchain /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain
cd
sleep 1
echo "Done"

      break
            ;;
  "Quit")
      echo "User requested exit"
      exit
      ;;
        *) echo "invalid option $REPLY";;
    esac
done