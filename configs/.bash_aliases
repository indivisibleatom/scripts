#Aliases for bash

voglProfile() {
  VOGL_CMD_LINE="--vogl_tracefile ${1}" LD_PRELOAD=$(readlink -f ${TOOLS}/vogl/vogl/vogl_build/libvogltrace64.so) ${2}
}

alias ..='cd ..'
alias pip='pip3'
alias python='python3'
alias ipy='ipython3 notebook'
alias n='nautilus'

alias b='cd build'

alias exp='pushd ${DEV}/experiments/'
alias ext='pushd ${DEV}/ext/'
alias cpputils='pushd ${DEV}/cpputils/'
alias avg='pushd ${DEV}/experiments/averaging'
alias geom='pushd ${DEV}/experiments/framework/geometry'
alias render='pushd ${DEV}/experiments/framework/rendering'
alias inc='pushd ${DEV}/experiments/framework/inc'
alias app='pushd ${DEV}/experiments/framework/app'

alias scripts='pushd ${DEV}/scripts/'
alias configs='pushd ${DEV}/scripts/configs'
alias ack='ack-grep'

alias gprofile=voglProfile
