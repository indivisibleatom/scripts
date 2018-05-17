set history save on

python
import sys
import os
sys.path.insert(0, '/usr/share/gcc-5/python/')
sys.path.insert(0, '/home/mukul/development/ext/src/gdb_printers/python/')
sys.path.append('/home/mukul/.config/Epic/GDBPrinters/')
sys.path.append('/home/mukul/development/scripts/configs/gdb_printers/')
sys.path.append('/home/mukul/development/ext/src/gdb_printers/gdb-pretty-frame-cpp/')

print(sys.path)

from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
print("Registered pretty printers for libstdcxx classes")

from UE4Printers import register_ue4_printers
register_ue4_printers(None)
print("Registered pretty printers for UE4 classes")

from eigenPrinters.printers import register_eigen_printers
register_eigen_printers(None)
print("Registered pretty printers for Eigen classes")

#import framefilter
#framefilter.CppFrameFilter()

end
