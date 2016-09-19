# Custom configurations
export TOOLS=~/tools
export DEV=~/development
export EXT=${DEV}/ext
export SHARED_ROOT=${DEV}/shared

#Set bash mode to vi
set -o vi

export PATH="${PATH}:${SHARED_ROOT}/bin"

#Custom env variables for different things
export TEXMF_ROOT=~/texmf

#Development environment variables
export GTEST_ROOT=${EXT}
export CUDA_HOME=/usr/local/cuda-7.5
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64

export PATH="${CUDA_HOME}/bin:$PATH"
if [ -d "${TOOLS}/processing/processing-3.0.2" ]; then
  export PATH="${PATH}:${TOOLS}/processing/processing-3.0.2"
fi
export PATH="${PATH}:${TOOLS}/graphicsDebugger"
export PATH="${PATH}:${TOOLS}/vogl/vogl/vogl_build"

#I need boost
export BOOST_ROOT=/usr/include
export BOOST_LIBRARYDIR=/usr/lib/x86_64-linux-gnu

#And mostly OGRE too
export OGRE_HOME=${EXT}/src/ogre

#Deep learning adventures
export CAFFE_ROOT=~/development/deepLearning/caffe
export PYTHONPATH=${PYTHONPATH}:${CAFFE_ROOT}/python
source /opt/intel/mkl/bin/mklvars.sh intel64
