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
    site.addsitedir(os.environ['DEV'] + '/ext/build/lib/python3.5/site-packages')
    site.addsitedir(os.environ['DEV'] + '/build/Release/lib/python3.5/site-packages')
    site.addsitedir(os.environ['DEV'] + '/build/Release/lib/python')
    site.addsitedir(os.environ['DEV'] + '/build/Release/lib')
if 'VTK_PATH' in os.environ:
    site.addsitedir(os.environ['VTK_PATH'] + '/lib/python3.5/site-packages')
