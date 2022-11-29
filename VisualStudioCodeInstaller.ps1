scoop install C:\Users\$env:UserName\buckets\extras\bucket\vscode.json

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

anjali.clipboard-historyWas the clipboard problem (slow)


code --uninstall-extension zweack.vsc-navigator
code --uninstall-extension yzane.markdown-pdf
code --uninstall-extension tchayen.markdown-links
code --uninstall-extension svsool.markdown-memo
code --uninstall-extension mervin.markdown-formatter
code --uninstall-extension joffreykern.markdown-toc
code --uninstall-extension goessner.mdmath
code --uninstall-extension DavidAnson.vscode-markdownlint
code --uninstall-extension csholmq.excel-to-markdown-table
code --uninstall-extension tomoki1207.pdf
code --uninstall-extension formulahendry.docker-explorer
code --uninstall-extension github.vscode-pull-request-github
code --uninstall-extension henriiik.docker-linter
code --uninstall-extension ms-python.isort
code --uninstall-extension ms-python.python
code --uninstall-extension ms-python.vscode-pylance
code --uninstall-extension ms-toolsai.jupyter
code --uninstall-extension ms-toolsai.vscode-jupyter-cell-tags
code --uninstall-extension ms-toolsai.vscode-jupyter-slideshow
code --uninstall-extension ms-vscode-remote.remote-wsl
code --uninstall-extension natizyskunk.sftp
code --uninstall-extension redhat.ansible
code --uninstall-extension shardulm94.trailing-spaces
code --uninstall-extension sleistner.vscode-fileutils
code --uninstall-extension softwaredotcom.swdc-vscode
code --uninstall-extension tombonnike.vscode-status-bar-format-toggle
code --uninstall-extension tomoki1207.pdf




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




