#Rename all files in input directory according to some rules
#Input - directory name, operation - fS, y/n - recurse
import glob
import os
import sys
import re

#Convert file to begin with small alpha, unless the first two
#letters in the first word are caps
def renameSmall(fileName): 
    firstWord = fileName.partition(' ')
    newName = fileName;
    if not firstWord[0][:2].isupper():
        newName = fileName[:1].lower() + fileName[1:]
    return newName;
  
if __name__ == "__main__":
    directory = sys.argv[1]
    os.chdir(directory)
    if len(sys.argv) < 3:
        operationFunc = None
    else:
        if sys.argv[2] == "fS": #First small
            operationFunc = renameSmall

        if operationFunc is not None:
            if len(sys.argv) >= 4 and re.match("y|Y", sys.argv[3]):
                recursive = True
            else:
                recursive = False
            globString = "**/*.*" if recursive else "*.*"
            renameOperation = os.rename if len(sys.argv
                  ) >=5 and sys.argv[4] =="run" else print
            for filePath in glob.glob(globString):
                filePathNoExt, ext = os.path.splitext(filePath)
                dirName, fileName = os.path.split(filePathNoExt)
                newName = operationFunc(fileName)
                renameOperation(filePath, os.path.join(dirName, newName + ext))
