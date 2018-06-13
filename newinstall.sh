#Things to do on a new machine
echo "set history save on" > ${HOME}/.gdbinit


sudo apt-get install vim
sudo apt-get install git
sudo apt-get install xdotool
sudo apt-get install ack-grep
sudo apt-get install moreutils
sudo apt-get install rlwrap

#sudo apt-get install texlive-science
#sudo apt-get install latexmk
#sudo apt-get install krita
#sudo apt-get install meld
#sudo apt-get install inkscape

# Level-2 software
#sudo apt-get install blender
#sudo apt-get install meshlab

# Optional software to consider installing
# eclipse-cdt
# docker

# Copy over configs 
cp ${DEV}/scripts/configs/.gdbinit ~/.gdbinit
cp ${DEV}/scripts/configs/.inputrc ~/.inputrc
#copy ${DEV}/scripts/configs/.latexmkrc ~/.latexmkrc
#ln -T ${DEV}/scripts/configs/inkscape_keybindings.xml ~/.config/inkscape/keys/default.xml
#ln -s ${DEV}/scripts/cmdref.sh ~/bin/cmdref
