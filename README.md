# Purpose
To get [trickybestia/linux-discord-rich-presence](https://github.com/trickybestia/linux-discord-rich-presence/) working working on Atomic Linux Distributions via Distrobox/Podman

## Installation
```bash
#!/bin/bash
wget -O Container-DRPC_installer.sh https://raw.githubusercontent.com/vibrantleaf/container-linux-discord-rich-presence/refs/heads/main/install.sh
chmod +x Container-DRPC_installer.sh
./Cntainer-DRPC_installer.sh
```

## Credits
- Sam Sanchez (sammorrison9800) on the universal-blue discourse group for the writeup that they created on how to setup discord rich presence to which this repo is heavly based on https://universal-blue.discourse.group/docs?topic=2177
- Trickybestia for creating the client that this container uses https://github.com/trickybestia/linux-discord-rich-presence/
