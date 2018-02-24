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
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

export PATH="${EXT}/build/bin:${EXT}/binaries:${CUDA_HOME}/bin:${PATH}"
export GOPATH="${EXT}/binaries/gopath"
export PATH="/usr/local/go/bin:${GOPATH}:${GOPATH}/bin:${PATH}"

if [ -d "${TOOLS}/processing/processing-3.0.2" ]; then
  export PATH="${PATH}:${TOOLS}/processing/processing-3.0.2"
fi

export PATH="${PATH}:${TOOLS}/graphicsDebugger"
export PATH="${PATH}:${TOOLS}/vogl/vogl/vogl_build"
export PATH="${PATH}:./node_modules/.bin"

export TEXDOC_VIEWER_PDF="(evince %s) &"

#VTK paths
export VTK_PATH=/usr/local/VTK
export PYTHONPATH="${VTK_PATH}/lib/python3.5/site-packages:${PYTHONPATH}"
export LD_LIBRARY_PATH="${VTK_PATH}/lib:/usr/local/lib:${LD_LIBRARY_PATH}"

#Paths for self-build python modules and related libraries
export PYTHONPATH="${EXT}/build/lib:${EXT}/build/lib/python3.5/site-packages:${PYTHONPATH}"
export PYTHONPATH="${EXT}/build/lib/python3.5/site-packages:${PYTHONPATH}"
export PYTHONPATH="${DEV}/build/Release/lib:${PYTHONPATH}"
export PYTHONPATH="${DEV}/build/Release/lib/python:${PYTHONPATH}"
export LD_LIBRARY_PATH=${EXT}/build/lib:${EXT}/binaries/lib64:${LD_LIBRARY_PATH}
