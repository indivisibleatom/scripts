# Custom configurations
export TOOLS=~/tools
export DEV=~/development
export EXT=${DEV}/ext
export SHARED_ROOT=${DEV}/shared

#Set bash mode to vi
set -o vi

export PATH="${PATH}:${SHARED_ROOT}/bin"

#Custom env variables for different things
export TEXMF_ROOT=/usr/local/share/texmf
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#Development environment variables
export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64

export PATH="${CUDA_HOME}/bin:${PATH}"
export PATH="${EXT}/binaries:${PATH}"
if [ -d "${TOOLS}/processing/processing-3.0.2" ]; then
  export PATH="${PATH}:${TOOLS}/processing/processing-3.0.2"
fi
export PATH="${PATH}:${TOOLS}/graphicsDebugger"
export PATH="${PATH}:${TOOLS}/vogl/vogl/vogl_build"

#Python path
export PYTHONPATH="${DEV}/ext/src/bin/python"
