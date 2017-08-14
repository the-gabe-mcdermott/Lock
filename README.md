A simple Bash script for encrypting and decrypting a single file.

Use:
  First argument:
    "-l": Lock the specified file.
    "-u": Unlock the specified file.
  Second argument:
    File name to (un)lock.

Note:
  When this script locks a file, it deletes the original, unlocked file.
  When this script unlocks a file, it deletes the original, locked file.

  This script appends ".lock" to files it locks.
  This script removes ".lock" suffixes from files it unlocks.
 
