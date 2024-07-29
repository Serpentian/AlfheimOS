{ config, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    # useOSProber = true;
    extraEntries = ''
menuentry 'Arch Linux' {
	insmod part_gpt
	insmod ext2
	search --no-floppy --fs-uuid --set=root d8ac40a1-c821-402f-b593-baf82f4efc31
	linux /boot/vmlinuz-linux root=UUID=d8ac40a1-c821-402f-b593-baf82f4efc31 rw
	initrd /boot/initramfs-linux.img
}

menuentry 'Windows Boot Manager (on /dev/sda1)' --class windows --class os $menuentry_id_option 'osprober-efi-B091-959B' {
	insmod part_gpt
	insmod fat
	set root='hd0,gpt1'
	if [ x$feature_platform_search_hint = xy ]; then
	  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,gpt1 --hint-efi=hd0,gpt1 --hint-baremetal=ahci0,gpt1  B091-959B
	else
	  search --no-floppy --fs-uuid --set=root B091-959B
	fi
	chainloader /EFI/Microsoft/Boot/bootmgfw.efi
}
    '';
  };
}
