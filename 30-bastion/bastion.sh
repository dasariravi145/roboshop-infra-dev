#!/bin/bash

growpart /dev/nvme0n1 4
lvextend -l -L +30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.release.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform -y