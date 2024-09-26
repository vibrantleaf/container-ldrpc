### Checking the Contianer Signature 
```bash
wget -O /tmp/container-ldrpc-cosign.pub https://raw.githubusercontent.com/vibrantleaf/container-ldrpc/refs/heads/main/cosign.pub
cosign verify --key /tmp/container-ldrp-cosign.pub  ghcr.io/vibrantleaf/container-ldrpc:latest
rm /tmp/container-ldrpc-cosign.pub
```
### Creating the distrobox
```bash
distrobox create --image ghcr.io/vibrantleaf/container-ldrpc:latest --name linux-discord-rich-presence
```
### Exporting to the host 
```bash
distrobox enter linux-discord-rich-presence
distrobox-export --bin /usr/bin/linux-discord-rich-presence --export-path $HOME/.local/bin
distrobox-export --bin /usr/bin/linux-discord-rich-presence-wrapper --export-path $HOME/.local/bin
exit
```
###  Creating & Enabling the Service
```bash
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
```
```
linux-discord-rich-presence -c ~/.config/linux-discord-rich-presencerc
