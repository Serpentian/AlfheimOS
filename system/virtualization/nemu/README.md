# Install piece of shit in VM and without network

Click next to show-up the "Install now" button; when you see the installation
button, press "Shift+F10" on your keyboard at the same time to launch a command
prompt. At this command prompt, type "regedit" and press enter to launch the
Windows Registry Editor.

When the Registry Editor opens, navigate to "HKEY_LOCAL_MACHINE\SYSTEM\Setup",
right-click on the "Setup" key and select "New => Key".

When prompted to name the key, enter "LabConfig" and press enter.

Now right-click on the "LabConfig" key and select "New => DWORD  (32-bit)"
value and create a value named "BypassTPMCheck", and set its data to "1". With
the same steps create the "BypassRAMCheck" and "BypassSecureBootCheck" values
and set also their data to "1", so it looks like the following image.

With those three values configured under the "LabConfig" key, close the
"Registry Editor", and then type exit in the "Command Prompt" followed by enter
to close the window. You can now click on the "Install now" button to proceed
to get "Microsoft Windows 11" installed as a virtual-machine on top of
VirtualBox.

---

For Windows 11: When prompted to select your country or region, press "Shift +
F10" to open the command prompt. Enter OOBE\BYPASSNRO and press Enter. The
system will restart, allowing you to select "I don't have internet" later on.
It is crucial to run this command as soon as possible, as doing so later in the
installation process will not work, and you may be required to create a
Microsoft account despite not having an internet connection.

---

qemu command line:

```
-drive file=/home/serpentian/Drives/ssd1/nemu/virtio-win-0.1.271.iso,media=cdrom
 -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
 -device virtio-serial \
 -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
```

https://wiki.qemu.org/Features/GuestAgent
