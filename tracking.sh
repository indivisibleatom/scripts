# VTK installation
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/VTK-8.0.0 \
-DVTK_WRAP_PYTHON=ON -DVTK_PYTHON_VERSION=3 -DCMAKE_MACOSX_RPATH=ON \
-DCMAKE_INSTALL_NAME_DIR=/usr/local/VTK-8.0.0/lib ..

# Boost install
./bootstrap.sh --prefix=/usr/local --with-libraries=all --libdir=/usr/local/lib \
  --includedir=/usr/local/include 

# Python installation
sudo ./configure --enable-shared --prefix=/usr/local LDFLAGS="-Wl,--rpath=/usr/local/lib"
