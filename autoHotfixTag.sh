#!/bin/sh

# echo the args

while :
do
  read -p "你想让commit($2)更新到所有大于($1)的tag吗？(Y/N)" choice
  case $choice in
    [Yy]* ) break;;
    [Nn]* ) exit 0;;
    * ) echo "Please answer yes or no.";;
  esac
done

while :
do
  read -p "是否当前本地所有的tag和remote origin已经同步过了？(Y/N)" choice
  case $choice in
    [Yy]* ) break;;
    [Nn]* ) exit 0;;
    * ) echo "Please answer yes or no.";;
  esac
done

function version_gt() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"; }
function version_le() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1"; }
function version_lt() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" != "$1"; }
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

# 获取所有的tag
allTags=$(git tag)

# 使用换行符分割tag字符串后成为数组
TAG_LIST=(${allTags//\n/ })

# 遍历所有大于指定的tag
for tag in "${TAG_LIST[@]}"
do
  # 如果tag大于当前线上运行的tag,那么修复的这个bug的commit应该也需要更新到这个tag里面
  if version_gt $tag $1;
  then
    echo $tag
    git branch hotfix/$tag $tag
    git checkout hotfix/$tag
    COMMIT_LIST=(${2//,/ })
    for commit in "${COMMIT_LIST[@]}"
    do
      git cherry-pick $commit
    done
    git tag -d $tag
    git tag -a $tag -m $3
    git push origin :$tag
    git push origin $tag
    git checkout master
    git branch -D hotfix/$tag
  fi
done
