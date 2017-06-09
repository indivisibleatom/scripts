#Things to do on a new machine
echo "set history save on" > ${HOME}/.gdbinit
sudo apt-get install ack-grep
sudo apt-get install blender
sudo apt-get install meshlab

sudo apt-get install latexmk
sudo apt-get install inkscape
sudo apt-get install texlive-science

copy ${DEV}/scripts/configs/.latexmkrc ~/.latexmkrc
ln -T ${DEV}/scripts/configs/inkscape_keybindings.xml ~/.config/inkscape/keys/default.xml

