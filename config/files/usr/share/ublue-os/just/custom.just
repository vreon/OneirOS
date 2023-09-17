!include /usr/share/ublue-os/just/bling.just

# Add boot parameters needed for a Framework 13 laptop
framework-13:
  rpm-ostree kargs --append="module_blacklist=hid_sensor_hub" --append="nvme.noacpi=1" --append="tpm_tis.interrupts=0"
