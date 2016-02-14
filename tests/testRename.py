#Testing rename utilities
import unittest
import renameFiles as rn

class renameSmallTest(unittest.TestCase):
    def testRenameSmall(self):
        self.assertTrue(rn.renameSmall("asdb") == "asdb")
        self.assertTrue(rn.renameSmall("Asbd") == "asbd")
        self.assertTrue(rn.renameSmall("ABbd") == "ABbd")
        self.assertTrue(rn.renameSmall("S/Abs") == "S/Abs")

def main():
    unittest.main()

if __name__ == "__main__":
    main()
