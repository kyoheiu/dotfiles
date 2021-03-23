import os

let dotfiles = getCurrentDir()
let home = getHomeDir()

for kind, path in walkDir(dotfiles):
  let (dir, name, ext) = path.splitFile
  if name == "dotfiles": continue
  else:
    case kind

    of pcFile:
      let target1 = home & name & ext
      removeFile(target1)
      path.createSymlink(target1)

    of pcDir:
      if name != ".git":
        for ckind, cpath in walkDir(path):
          let (cdir, cname, cext) = cpath.splitFile
          if cname != "colors":
            let configName = name & "/" & cname & cext
            let target2 = home & ".config/" & configName
            removeFile(target2)
            cpath.createSymlink(target2)
    
    else: continue