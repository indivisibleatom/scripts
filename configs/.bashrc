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
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}

export PATH="${EXT}/binaries:${CUDA_HOME}/bin:$PATH"

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
export LD_LIBRARY_PATH="${VTK_PATH}/lib:${LD_LIBRARY_PATH}"

export PYTHONPATH="${EXT}/src/bin/python:${PYTHONPATH}"
export PYTHONPATH="${EXT}/src/bin/python/lib/python3.5/site-packages:${PYTHONPATH}"
export PYTHONPATH="${DEV}/build/python:${PYTHONPATH}"
