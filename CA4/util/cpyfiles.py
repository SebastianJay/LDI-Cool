#Jay - for copying files from GitHub repo to VM share folder
from shutil import copytree, rmtree
from os.path import exists

src = 'C:/Users/Student/Documents/GitHub/LDI-Cool/CA4/test'
dst = 'C:/VM_share/ca4/test'

if exists(dst):
    rmtree(dst)
copytree(src, dst)
