# Scrapes Google Scholar citations for an author and returns a bib file 
# for them. Arguments - html location

from bs4 import BeautifulSoup
import sys

doc = BeautifulSoup(open(sys.argv[1]), "lxml")
print(doc)
