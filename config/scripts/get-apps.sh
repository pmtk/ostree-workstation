#!/usr/bin/env bash

set -euo pipefail

export EGET_BIN=/usr/bin

cd /tmp
curl -o eget.sh https://zyedidia.github.io/eget.sh
cat > eget.sums << EOF
0e64b8a3c13f531da005096cc364ac77835bda54276fedef6c62f3dbdc1ee919 eget.sh
EOF
sha256sum -c eget.sums
bash eget.sh
mv ./eget $EGET_BIN/eget
rm -rf ./eget.sh ./eget.sums

eget jesseduffield/lazygit
ln -s /usr/bin/lazygit /usr/bin/lg

eget neovim/neovim
eget BurntSushi/ripgrep
eget --asset=amd64.tar go-task/task
eget sachaos/viddy
eget --asset x86_64-linux-musl --all nushell/nushell
eget --asset linux_amd64.tar.gz --asset ^sig caddyserver/caddy
eget zellij-org/zellij
eget aristocratos/btop
eget --asset linux-musl sxyazi/yazi

#curl -sS https://starship.rs/install.sh | BIN_DIR=/usr/bin FORCE=1 VERBOSE=1 sh
