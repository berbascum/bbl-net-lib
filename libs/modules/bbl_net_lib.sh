#!/bin/bash

## berb-bash-libs net functions
#
# Upstream-Name: berb-bash-libs
# Source: https://github.com/berbascum/berb-bash-libs
#
# Copyright (C) 2024 Berbascum <berbascum@ticv.cat>
# All rights reserved.
#
# BSD 3-Clause License
#
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#    * Neither the name of the <organization> nor the
#      names of its contributors may be used to endorse or promote products
#      derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#[HEADER_SECTION]
fn_header_info() {
    BIN_TYPE="lib"
    BIN_SRC_TYPE="bash"
    BIN_SRC_EXT="sh"
    BIN_NAME="bbl_net_lib"
    TOOL_VERSION="1.0.0.1"
    TOOL_VERSION_INT="1001"
    TOOL_RELEASE="testing"
    URGENCY='optional'
    TESTED_BASH_VER='5.2.15'
}
#[HEADER_END]


fn_bblnet_ip_forward_activa() {
    ## Activa ipv4_forward (requerit per xarxa containers) i reinicia docker.
    ## És la primera funció que crida l'script
    FORWARD_ES_ACTIVAT=$(cat /proc/sys/net/ipv4/ip_forward)
    if [ "$FORWARD_ES_ACTIVAT" -eq "0" ]; then
  	echo "" && echo "Activant ip4_forward..."
	${SUDO} sysctl -w net.ipv4.ip_forward=1
	${SUDO} systemctl restart docker
    else
	echo && echo "ip4_forward prèviament activat!"
    fi
}
