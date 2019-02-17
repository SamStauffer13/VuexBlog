#!/usr/bin/env sh
set -e

npm run build

cd dist

echo 'www.samstauffer.net' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

cd -