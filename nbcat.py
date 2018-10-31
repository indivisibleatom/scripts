#!/usr/bin/python3.5m
import sys
import nbformat
from nbconvert import PythonExporter


def convertNotebook(notebookPath):
    with open(notebookPath) as fh:
        nb = nbformat.reads(fh.read(), nbformat.NO_CONVERT)

    exporter = PythonExporter()
    source, meta = exporter.from_notebook_node(nb)
    lines = source.split("\n")
    for line in lines:
        print(line)


if __name__ == "__main__":
    convertNotebook(sys.argv[1])
