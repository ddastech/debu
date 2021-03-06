#!/bin/bash
BACKUPFILE=backup-$(date +%m-%d-%y)
archive=${1:-$BACKUPFILE}
tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "Directory $(pwd) backed up in archive file \"$archive.tar.gz\"."
exit 0
