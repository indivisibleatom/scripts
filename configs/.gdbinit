set history save on

python
import sys
sys.path.insert(0, '/usr/share/gcc-5/python/')
sys.path.insert(0, '${EXT}/src/gdb_printers/python')
sys.path.insert(0, '${EXT}/src/gdb_printers/gdb-pretty-fram-cpp')
sys.path.insert(0, '${DEV}/scripts/configs/gdb_printers')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
print("Registered pretty printers for libstdcxx classes")

sys.path.append('/home/mukul/.config/Epic/GDBPrinters/')
from UE4Printers import register_ue4_printers
register_ue4_printers(None)
print("Registered pretty printers for UE4 classes")

from EigenPrinters import register_eigen_printers
register_eigen_printers(None)
print("Registered pretty printers for Eigen classes")

#import framefilter
#framefilter.CppFrameFilter()

end
