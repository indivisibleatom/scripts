#Aliases for bash

voglProfile() {
  VOGL_CMD_LINE="--vogl_tracefile ${1}" LD_PRELOAD=$(readlink -f ${TOOLS}/vogl/vogl/vogl_build/libvogltrace64.so) ${2}
}

alias ..='cd ..'
alias pip='pip3'
alias python='python3'
alias ipy='ipython3 notebook'
alias processing='${DEV}/tools/processing-3.3/processing'
alias n='nautilus'
alias initlatex='cp ${DEV}/shared/latex/src/protoDir/* .'

alias b='pushd ${DEV}/experiments/build'

alias exp='pushd ${DEV}/experiments/'
alias ext='pushd ${DEV}/ext/'
alias cpputils='pushd ${DEV}/cpputils/'
alias avg='pushd ${DEV}/experiments/averaging'
alias modeling='pushd ${DEV}/modeling'
alias geom='pushd ${DEV}/experiments/framework/geometry'
alias render='pushd ${DEV}/experiments/framework/rendering'
alias inc='pushd ${DEV}/experiments/framework/inc'
alias app='pushd ${DEV}/experiments/framework/app'
alias papers='pushd ${DEV}/papers'
alias ceed='(pushd ${EXT}/src/ceed/bin; PYTHONPATH=../../cegui/build/lib:../:$PYTHONPATH python2 ./ceed-gui)'
alias scripts='pushd ${DEV}/scripts/'
alias configs='pushd ${DEV}/scripts/configs'
alias ack='ack-grep'

alias gprofile=voglProfile

# Additional build script aliases
source ${DEV}/buildScripts.sh
