#Aliases for bash

voglProfile() {
  VOGL_CMD_LINE="--vogl_tracefile ${1}" LD_PRELOAD=$(readlink -f ${TOOLS}/vogl/vogl/vogl_build/libvogltrace64.so) ${2}
}

alias ..='cd ..'
alias pip3='/usr/bin/pip3'
alias python3='/usr/bin/python3'
alias ipy='ipython3 notebook'
alias processing='${DEV}/tools/processing-3.3/processing'
alias n='nautilus >/dev/null 2>&1'
alias initlatex='cp -P ${DEV}/shared/latex/src/protoDir/* .'
#alias meshlab='meshlab.sh'
#alias meshlabserver='meshlabserver.sh'
alias ccViewer='ccViewer.sh'
alias ack='ack-grep'
alias xclip='xclip -selection clipboard'
#alias vim='vim --servername VIM'

alias b='pushd ${DEV}/experiments/build'
alias ext='pushd ${DEV}/ext/'
alias exp='pushd ${DEV}/experiments/'
alias avg='pushd ${DEV}/experiments/averaging'
alias traj='pushd ${DEV}/experiments/planning/trajectoryOptimization'
alias frm='pushd ${DEV}/experiments/framework'
alias geom='pushd ${DEV}/experiments/framework/geometry'
alias rndr='pushd ${DEV}/experiments/framework/rendering'
alias inc='pushd ${DEV}/experiments/framework/inc'
alias app='pushd ${DEV}/experiments/framework/app'
alias lrn='pushd ${DEV}/experiments/learning'
alias ppr='pushd ${DEV}/papers'
alias ceed='(pushd ${EXT}/src/ceed/bin; PYTHONPATH=../../cegui/build/lib:../:$PYTHONPATH python2 ./ceed-gui)'
alias scr='pushd ${DEV}/scripts/'
alias conf='pushd ${DEV}/scripts/configs'

alias gprofile=voglProfile

# Additional build script aliases
if [ -f ${DEV}/buildScripts.sh ]; then
  source ${DEV}/buildScripts.sh;
fi
