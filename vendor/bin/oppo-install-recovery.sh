#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:90cf308cd9adbfba5dc7a1d8c9dd3937ce0f9609; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/spmfw:60384:dfc31a9162fc484622b9d19601079eb027c65909 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:90cf308cd9adbfba5dc7a1d8c9dd3937ce0f9609 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
