#!/bin/bash
set -xout pipefail

distrobox create --image ghcr.io/vibrantleaf/container-ldrpc:latest --name linux-discord-rich-presence
distrobox-export --bin /usr/bin/linux-discord-rich-presence --export-path $HOME/.local/bin
distrobox-export --bin /usr/bin/linux-discord-rich-presence-wrapper --export-path $HOME/.local/bin
linux-discord-rich-presence -c ~/.config/linux-discord-rich-presencerc
mkdir -p ~/.config/systemd/user
cat << EOF > ~/.config/systemd/user/discord-rich-presence.service
[Unit]
Description=Discord Rich Presence Service

[Service]
Type=simple
[Unit]
Description=Discord Rich Presence Service

[Service]
Type=simple
ExecStart=/home/{$(whoami)/.local/bin/linux-discord-rich-presence -c %h/.config/linux-discord-rich-presencerc

[Install]
WantedBy=default.target
EOF
systemctl --user enable --now discord-rich-presence.service
systemctl --user status discord-rich-presence.service
