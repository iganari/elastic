#!/bin/bash

set -x

: "make authorized file" & {
mkdir /root/.ssh
chmod 700 /root/.ssh
touch /root/.ssh/authorized_keys
}

: "insert authorized" & {
cat << __EOF__ > /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI3cP5y++bkmQ2RbNAA+u67+e3q8arl3Lx+gXfiW5+BsjQ4u7ChHXrs1L9nGs3iZ3mENqMSBL+Ne5FIfC6Fy//JwK5dOZPfL6NH3fvih6sUxowX035ReFxhzmRaRzT/t0Gxs43d1HQ05vFa///Gx6aBsv89u5MbGipg+ABiNT4dlHk+jVF/UQ1ZvTiSgV2b88M4VwCt8cgnnpqoat0UBJ/c7Ef1Apk2/1gz/0xRpzvbgKXd2+zI/n3EGU4gmqEnUs/ZSBtfhL1YEfeDbO6fC2i0oLQI9Ze++o3PEbOGpk67EPTPqXeCy/KKP4Mvr8iPE/FixQ0FABQS4//bjcFCsYj for elasticsearch
__EOF__
}
