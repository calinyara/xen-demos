#!/bin/bash

qemu-system-aarch64 \
	-machine virt,gic_version=3 \
	-machine virtualization=true \
	-cpu cortex-a57 \
	-machine type=virt \
	-m 4096 \
	-smp 4 \
	-bios ./bin/u-boot.bin \
	-device loader,file=./bin/xen,force-raw=on,addr=0x48400000 \
	-device loader,file=./bin/virt-gicv3.dtb,addr=0x48600000 \
	-device loader,file=./bin/dom0_Image,addr=0x40400000 \
	-device loader,file=./bin/dom0.cpio.gz,addr=0x41A00000 \
	-device loader,file=./bin/vm1_Image,addr=0x45E00000 \
	-device loader,file=./bin/vm1.cpio.gz,addr=0x47400000 \
	-device loader,file=./bin/dom0domu.scr,addr=0x40200000 \
	-nographic
