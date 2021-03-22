import os

let dotfiles = getCurrentDir()
let home = getHomeDir()

for kind, path in walkDir(dotfiles):
  let (dir, name, ext) = path.splitFile
  if name == "dotfiles": continue
  else:
    if kind == pcFile:
      let target1 = home & name & ext
      removeFile(target1)
      path.createSymlink(target1)
    if kind == pcDir:
      if name != ".git":
        for fkind, fpath in walkDir(path):
          let (fdir, fname, fext) = fpath.splitFile
          if fname != "colors":
            let symname = name & "/" & fname & fext
            let target2 = home & ".config/" & symname
            removeFile(target2)
            fpath.createSymlink(target2)