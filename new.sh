BRANCH=$1
TITLE=$2

hugo new $BRANCH/$TITLE/index.md

mkdir -p ./$BRANCH/$TITLE/images