FROM debian:trixie-slim

RUN <<'EOT'
set -e
apt-get update
apt-get install -y --no-install-recommends gcc bison gawk g++ make patch python3 texinfo xz-utils
apt-get install -y --no-install-recommends curl ca-certificates sudo systemd-repart
apt-get clean
rm -rf /var/lib/apt/lists/*

ln -svf /bin/bash /bin/sh
EOT

RUN <<'EOT'
set -e
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

cat << EOF > /etc/sudoers.d/lfs
lfs ALL=NOPASSWD: ALL
EOF
EOT

USER lfs:lfs
ENV LFS=/workspaces/lfs/lfs

RUN <<'EOT'
set -e
cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/workspaces/lfs/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF
EOT
