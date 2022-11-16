#!/bin/sh

 

CURRENT_DIR=$(pwd)
PROJECT_DIR="${CURRENT_DIR}"

 

for DirFiles in $(find  ${PROJECT_DIR}/* -type f ); do
  test -f "$DirFiles" || continue
  printf "%s\n" "${DirFiles}"
  git add -A "${DirFiles}"
  git commit -a -m "[ADD] New ${DirFiles##*/} File"
  printf "%s" "Enter url of repo:"
  read repo_url
  git remote add origin ${repo_url} || continue 
  git push origin master 
  break
done
