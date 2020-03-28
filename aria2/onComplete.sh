#!/bin/ash
 
# $1 is gid.
# $2 is the number of files.
# $3 is the path of the first file.
 
DOWNLOAD=/aria2-download # aria2的下载目录
COMPLETE=/aria2-complete # 你要设置的转移目录路径
LOG=/aria2/aria2.log  #脚本操作日志
SRC=$3
 
if [ "$2" == "0" ]; then
  echo `date` "INFO  no file to move for" "$1". >> "$LOG"
  exit 0
fi
 
while true; do
  DIR=`dirname "$SRC"`
  if [ "$DIR" == "$DOWNLOAD" ]; then
    echo `date` "INFO " "$3" moved as "$SRC". >> "$LOG"
    mv "$SRC" "$COMPLETE" >> "$LOG" 2>&1
    exit $?
  elif [ "$DIR" == "/" -o "$DIR" == "." ]; then
    echo `date` ERROR "$3" not under "$DOWNLOAD". >> "$LOG"
    exit 1
  else
    SRC=$DIR
  fi
done
