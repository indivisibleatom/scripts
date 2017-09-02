set history save on

python
import sys
sys.path.insert(0, '/usr/share/gcc-5/python/')
sys.path.insert(0, '${EXT}/src/gdb_printers/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
