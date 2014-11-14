#!/bin/sh

list_alldir(){
  for file2 in `ls -a $1`
  do
    if [ x"$file2" != x"." -a x"$file2" != x".." ];then
      if [ -d "$1/$file2" ];then
        list_alldir "$1/$file2"
      else
        fold=`ls -l $1/$file2 |   awk '{print $11}'`
        count=`du -h $fold | awk '{print $1}'`
        echo $count $1/$file2 
      fi
    fi
  done
}
list_alldir /home/sun/cf-release/blobs | sort -hr | head -50 > /home/sun/Desktop/x.log

echo "hjah"
