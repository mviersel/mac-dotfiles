gis() {
  git status
}

gif() {
  git fetch
  git pull
}

gic() {
  git commit -m "$*"
  git push
}
