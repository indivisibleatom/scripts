# Custom configurations
export TOOLS=~/tools
export DEV=~/development
export DATA=${DEV}/data
export EXT=${DEV}/ext
export EXP=${DEV}/experiments
export SHARED_ROOT=${DEV}/shared

#Set bash mode to vi
set -o vi

export PATH="${PATH}:${SHARED_ROOT}/bin:${DEV}/scripts"

#Custom env variables for different applications
export TEXMF_ROOT=/usr/local/share/texmf
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
export RLWRAP_HOME=${DEV}/tools/rlwrap

export PATH="${EXT}/build/bin:${EXT}/binaries:${CUDA_HOME}/bin:${PATH}"
export GOPATH="${EXT}/binaries/gopath"
export PATH="${HOME}/bin:/usr/local/go/bin:${GOPATH}:${GOPATH}/bin:${PATH}"

if [ -d "${TOOLS}/processing/processing-3.0.2" ]; then
  export PATH="${PATH}:${TOOLS}/processing/processing-3.0.2"
fi

if [ -z "${CMDREF_DIR}" ]; then
  export CMDREF_DIR=${DEV}/notes
fi

export PATH="${PATH}:./node_modules/.bin"

export TEXDOC_VIEWER_PDF="(evince %s) &"

#VTK paths
export VTK_PATH=/usr/local/VTK
export LD_LIBRARY_PATH="${VTK_PATH}/lib:/usr/local/lib:${LD_LIBRARY_PATH}"

#Paths for self-build python modules and related libraries
export LD_LIBRARY_PATH=${EXT}/build/lib:${EXT}/binaries/lib64:${LD_LIBRARY_PATH}

# Bash configs
# pushd popd magic --
# https://unix.stackexchange.com/questions/4290/aliasing-cd-to-pushd-is-it-a-good-idea
pushd()
{
  if [ $# -eq 0 ]; then
    DIR="${HOME}"
  else
    DIR="$1"
  fi

  builtin pushd "${DIR}" > /dev/null
  echo -n "DIRSTACK: "
  dirs | cut -c 1-80 | awk '{ print "\033[32m"$1"\033[0m \033[31m"$2"\033[00m" }'
}

pushd_builtin()
{
  builtin pushd > /dev/null
  echo -n "DIRSTACK: "
  dirs | cut -c 1-80 | awk '{ print "\033[32m"$1"\033[0m \033[31m"$2"\033[00m" }'
}

popd()
{
  builtin popd > /dev/null
  echo -n "DIRSTACK: "
  dirs | cut -c 1-80 | awk '{ print "\033[32m"$1"\033[0m \033[31m"$2"\033[00m" }'
}

alias cd='pushd'
alias back='popd'
alias flip='pushd_builtin'

ackeg() {
  ack --follow -l $1 ${EXT}/examples --ignore-file=match:/[.]html
}

acksrc() {
  if [ $# -eq 1 ]; then
    DIR="${EXT}/src"
    STR="$1"
  else
    DIR="${EXT}/src/$1"
    STR="$2"
  fi
  ack --follow -l ${STR} ${DIR} --ignore-file=match:/[.]html
}
