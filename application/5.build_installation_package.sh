#!/usr/bin/env bash
# Makes the installation package, depending the platform it can be an .exe, deb, rpm, etc..

set -o errexit


if [ `uname -s` = "Linux" ] ; then
#  cd Setups/Ubuntu/
#  ./linux_ubuntu_setup.sh
#  cd ../..
  cd .
else
   # MS.Windows. Inno Setup (isetup) + QuickStart Pack (ispack) must be both installed. The Inno Setup directory must be placed in the PATH variable environnment.
   cd Setups/Windows/
   iscc windows_setup.iss
   cd ../..
fi

cd Setups/Sources
./make_source.sh
