#! /bin/bash
if test $# -ne 2;
then 
  echo "Bad number of Arguments: 
        First give '-l' for lock or '-u' for unlock. Then give the name of one file to (un)lock."

else
  #Get the name of the file to operate on.
  targetFileName=$2

  #Read first argument:
  #  lock on "-l" and unlock on "-u"
  if test $1 == "-l"
  then 
    #Lets Lock it!

    #Append ".lock"
    lockedName=`printf "$targetFileName.lock"`
    openssl aes-256-cbc -a -salt -in $targetFileName -out $lockedName
    #Delete the original target file.
    rm $targetFileName
  elif test $1 == "-u"
  then
    #Lets Unlock it!
    
    #Remove ".lock"
    unlockedName=`echo $targetFileName | sed 's/\.lock//g'`
    #Unlock it
    openssl aes-256-cbc -d -a -in $targetFileName -out $unlockedName
    #Delete the locked file.
    rm $targetFileName

  else
    echo "bad first argument. Valid arguments are:
          -l: Lock
          -u: Unlock"
  fi
 fi

