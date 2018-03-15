#Receives the current directory as first argument. Calls bash with linux style filepath for it
import sys
import re
import os

currentDir = sys.argv[1]
currentDir = currentDir.replace("\\","/")	#Switch OS line endings
driveRegex = re.compile("(.):")
changedPath = driveRegex.sub("/cygdrive/\\1",currentDir)
os.system('bash --login -i -c "cd %s;bash"' % changedPath)
