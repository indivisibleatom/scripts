#!/bin/bash
# Launch mathematica and maximize
/usr/local/Wolfram/Mathematica/11.2/Executables/Mathematica &
sleep 5
wmctrl -l | grep 'Welcome to Wolfram Mathematica' | awk '{print $1}' | xargs -I {} xdotool key --window {} Return
sleep 1
wmctrl -l | grep 'Wolfram Mathematica 11.2 Student Edition - Personal Use Only' | xargs -I {} xdotool windowmove {} 0 0
sleep 0.5
wmctrl -l | grep 'Wolfram Mathematica 11.2 Student Edition - Personal Use Only' | xargs -I {} xdotool windowactivate {}
sleep 0.5
wmctrl -l | grep 'Wolfram Mathematica 11.2 Student Edition - Personal Use Only'| xargs -I {} xdotool windowsize {} 1200 1920
