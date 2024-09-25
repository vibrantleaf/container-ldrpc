ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-40}"
FROM quay.io/fedora/fedora:${FEDORA_MAJOR_VERSION}

# get dependacys
WORKDIR /
RUN dnf update -y --refresh
RUN dnf install -y git rust cargo clippy rustfmt 

# clone the linux-discord-rich-pressence source code
RUN git clone --recurse-submodules --remote-submodules https://github.com/trickybestia/linux-discord-rich-presence/ /linux-discord-rich-presence-src
WORKDIR /linux-discord-rich-presence-src
RUN git fetch --tags && git checkout $(git describe --tags "$(git rev-list --tags --max-count=1)")

# build linux-discord-rich-pressence
WORKDIR /linux-discord-rich-presence-src
RUN cargo build --release
RUN install -Dm0755 -t /usr/bin/ ./target/release/linux-discord-rich-presence
RUN install -Dm0755 -t /usr/bin/ ./doc/linux-discord-rich-presence-desktop-wrapper
RUN install -Dm0644 -t /usr/share/applications/ ./doc/linux-discord-rich-presence.desktop
RUN install -Dm0644 -t /usr/share/applications/ ./doc/linux-discord-rich-presence-minimized.desktop

# clean up
WORKDIR /
RUN rm -rf /linux-discord-rich-presence-src && \
 dnf remove git rust cargo clippy rustfmt -y && \
 dnf clean all -y \
 rm -rf /tmp/* \
 rm -rf /var/cache/*
