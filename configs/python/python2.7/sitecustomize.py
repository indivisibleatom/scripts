# install the apport exception handler if available
try:
    import apport_python_hook
except ImportError:
    pass
else:
    apport_python_hook.install()

import site
import os

if 'DEV' in os.environ:
    site.addsitedir(os.environ['DEV'] + '/ext/build/lib/python2.7/site-packages')
