#!/bin/bash

DEBIAN_CODENAMES=(7-wheezy 8-jessie 9-stretch 10-buster)
for CODENAME in ${DEBIAN_CODENAMES} do
  curl -o tmp/${CODENAME}-netboot.tar.gz http://ftp.debian.org/debian/dists/${CODENAME}/main/installer-amd64/current/images/netboot/netboot.tar.gz
  tar tmp/debian/${CODENAME}-netboot.tar.gz tmp/debian/${CODENAME}
  mkdir -p images/debian/${CODENAME}/amd64/
  tmp/debian/${CODENAME}/debian-installer/amd64/linux images/debian/${CODENAME}/amd64/
  tmp/debian/${CODENAME}/debian-installer/amd64/initrd.gz images/debian/${CODENAME}/amd64/
done
