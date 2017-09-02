#Things to do on a new machine
echo "set history save on" > ${HOME}/.gdbinit

# Optional software to consider installing
# eclipse-cdt
# docker

sudo apt-get install vim
sudo apt-get install texlive-science

# Automation
sudo apt-get install xdotool

# Utils
sudo apt-get install ack-grep
sudo apt-get install blender
sudo apt-get install meshlab
sudo apt-get install latexmk
sudo apt-get install inkscape
sudo apt-get install krita
sudo apt-get install meld
sudo apt-get install git

# Copy over configs 
copy ${DEV}/scripts/configs/.gbdinit ~/.gdbinit
copy ${DEV}/scripts/configs/.latexmkrc ~/.latexmkrc
ln -T ${DEV}/scripts/configs/inkscape_keybindings.xml ~/.config/inkscape/keys/default.xml

