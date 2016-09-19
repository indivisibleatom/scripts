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
alias smooth='pushd ${DEV}/experiments/smoothing/'

alias gprofile=voglProfile
