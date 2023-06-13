Kernel Based Virtualization

**KVM (Kernel-based Virtual Machine)** is an open source, full virtualization solution for x86 hardwares containing virtualization extensions. It is a hypervisor built into the Linux kernel and unlike regular VM players like Virtualbox and VMware which use emulation, KVM uses CPU extensions for hardware assisted virtualization via a kernel module (thats the secret for that blazing speed). 
Each virtual machine has private virtualized hardware: a network card, disk, graphics adapter and all the peripherals. 

> This thing is, it's only for Linux.
> For Windows it is [developing](https://github.com/ddk50/winkvm)

In this blog post, we will learn how to setup all the required components one by one, to finally be able to create a hardware accelerated VM.
  ## KVM
> KVM is a hardware based thing, and therefore has some hardware prerequisites. More straightly, to be able to run a kernel based virtual machine, your processor **must** have hardware virtualization compatibility (Nowadays most of them provide this)
> 
> Hardware virtualization enables a CPU to act as if you have several independent computers, in order to enable several operating systems to run at the same time on the same machine. Fortunately, both AMD and Intel have dedicated extensions to provide the functionality. AMD has AMD-V and Intel has VT-x.

1) To check whether your processor is compatible or not, run

`LC_ALL=C lscpu | grep Virtualization`

or

`grep -E --color=auto 'vmx|svm|0xc0f' /proc/cpuinfo`

If nothing appears, your best bet is that it maybe disabled by BIOS. So, head over to BIOS menu and enable **Hardware virtualization** (or something sounding similar. Every vendor has it's own set of nomenclature in these situations :/ ). 

 After that, head to revert back to the starting of step 1.

 If still nothing happens, and if nothing *very wild* is going on, probably your device doesn't support this and you will not be able to use KVM.

2) Now that you know your system is compatible from hardware side, it's time for software compatibility test. 
> KVM requires some kernel module (most probably you maybe having them already) : 
>    - **kvm.ko**, that provides the core virtualization infrastructure  
>    - A processor specific module, **kvm-intel.ko** or **kvm-amd.ko**.  

> The Userspace component of KVM is included in mainline QEMU, as of 1.3 and Kernel Component of KVM is in [mainline LINUX kernel](https://git.kernel.org/pub/scm/virt/kvm/kvm.git/tree/). And that's how you know this isn't some random mod/trick off the internet.

To check if you have the required modules in your kernel, run the following command :

`zgrep CONFIG_KVM /proc/config.gz` 

Outputs should be either `y` or `m`.

And then check if these modules are loaded or not

`lsmod | grep kvm`

If the modules are not loaded (i.e. if the command doesn't output anything), you have to [manually load them](https://wiki.archlinux.org/index.php/Kernel_module#Manual_module_handling).

> If modprobing *kvm_intel* or *kvm_amd* fails but modprobing *kvm* succeeds, and `lscpu` claims that hardware acceleration is supported,  check the BIOS settings. Some vendors, especially laptop vendors, disable these processor extensions by default. To determine whether there is no hardware support or whether the extensions are disabled in BIOS, the output from `sudo dmesg --level=err,warn` after having failed to modprobe will tell.  

And you're ready now.
  
## virtio API  

The next layer of abstraction is **virtio API**. To setup this, we have to go though some module tests, as we did in kvm's setup.

Check if Virtio module is there in your kernel.

`zgrep VIRTIO /proc/config.gz ` 

and then check if it is loaded (actually there are a list of modules to be checked, given below the command)

`lsmod | grep virtio  `

Don't worry if they are not loaded, we will load them by ourselves :
  
- network device : `modprobe virtio-net`
- block device : `modprobe virtio-blk`
- controller device : `modprobe virtio-scsi`
- serial device : `modprobe virtio-serial`
- balloon device : `modprobe virtio-balloon`
  
 > Doesn't matter if some modules are not loaded, or not found. (we may face problems later, but who cares for later? )

## QEMU
Now that the CPU is being *emulated* (hmm?) by KVM, we need to emulate other devices, like USB peripherals, display, HDD etc. Here is when QEMU (Quick Emulator) comes in action.

Install QEMU with your package manager. 

`pacman -S qemu`

From this point you are ready to create virtual machines and run them. But this will include a lot of command line instructions, no GUI and bare minimum funtionality. So we will add some more wrappers.

## libvirt
There are a [lot of tools](https://www.linux-kvm.org/page/Management_Tools) available for KVM management. Go through them once and see if something catches your eye.

I use libvirt for KVM management and thats what I can talk about :)

So [Libvirt](http://libvirt.org/) is collection of software that provides a convenient way to manage virtual machines and other virtualization functionality, such as storage and network interface management.libvirt is the wrapper which will control QEMU. So libvirt will control the KVM and QEMU both in short for us.

Install libvirt.

`pacman -S libvirt`

Start libvirt daemon,

`systemctl start libvirtd.service`

> You may want to use your init system, but if it is systemd (which is the most popular one), above command will work.

libvirt keeps it's files at `/var/lib/libvirt/`. And this is where would gigantic virtual drives will live too (probably as `qcow` files), so its worth knowing.

Libvirt provides a CLI tool to control the VMs, called virsh. But we are going to install a GUI tool too.
## virt-manager
So, [virt-manager](https://virt-manager.org/) is our last layer of abstraction. This gives us the required GUI to talk to the VMs. Now instead of typing commands, you can click buttons.

`pacman -S virt-manager`

there are also some extra tools which you may require:

`pacman -S virt-install virt-viewer`

## (cherry on the top)
Install these 

`pacman -S ebtables dnsmasq iptables bridge-utils openbsd-netcat`

- **ebtables** is used  for setting NAT
- **dhclient** provides dhcp resolution (You most probably have this one installed)
- **dnsmasq** is used to provide IP addresses to VMs
- **bridge-utils** is used to create bridge iterfaces
- **openbsd-netcat** provides functionality to SSH into our VM

Now you are all set up to fire a VM and play that 4k video, without frying your system. Wait no, not really. Although you can now start VMs, there is a lot of **configuration** that needs to be done to achieve that bare-metal performance, but thats a topic for another day.

See this : https://www.linux-kvm.org/page/HOWTO
