#Rename all files in input directory according to some rules
#Input - directory name, operation - fS, y/n - recurse
import glob
import os
import sys
import re

#Convert file to begin with small alpha, unless all are the
#letters in the first word are caps
def renameSmall(fileName): 
    firstWord = fileName.partition(' ')
    newName = fileName;
    if not firstWord[0].isupper():
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
            for fileName in glob.glob(globString):
                fileNameNoExt = os.path.splitext(fileName)[0]
                newName = operationFunc(fileNameNoExt)
                print(newName);
            #os.rename(file,` 
