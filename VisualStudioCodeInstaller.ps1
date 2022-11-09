scoop install vscode

reg import C:\Users\$env:UserName\scoop\apps\vscode\current\install-context.reg
reg import C:\Users\$env:UserName\scoop\apps\vscode\current\install-associations.reg


code --install-extension %EXTENSION_HERE%

cat extensions.list |% { code --install-extension $_}

List of Extensions
wayou.vscode-todo-highlight
JordanEckowitz.indexify
wix.codio
jeff-hykin.macro-commander
BradyDowling.auto-coder
Shan.code-settings-sync
extr0py.vscode-relative-line-numbers
Asuka.insertnumbers
naumovs.color-highlight

GO THROUGH THESE:
C:\!\Text\ALL_EXTENSIONS_TO_GO_THROUGH.txt



IDS:
code --install-extension alefragnani.bookmarks
code --install-extension alexdima.copy-relative-path
code --install-extension donjayamanne.githistory
code --install-extension file-icons.file-icons
code --install-extension formulahendry.docker-explorer
code --install-extension github.vscode-pull-request-github
code --install-extension henriiik.docker-linter
code --install-extension ms-python.isort
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.vscode-jupyter-cell-tags
code --install-extension ms-toolsai.vscode-jupyter-slideshow
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension natizyskunk.sftp
code --install-extension redhat.ansible
code --install-extension shardulm94.trailing-spaces
code --install-extension sleistner.vscode-fileutils
code --install-extension softwaredotcom.swdc-vscode
code --install-extension tombonnike.vscode-status-bar-format-toggle
code --install-extension tomoki1207.pdf
code --install-extension vscode-icons-team.vscode-icons

code --install-extension tabnine.tabnine-vscode

code --install-extension shalldie.background




