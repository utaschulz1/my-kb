# Check WSL disk usage
wsl --list --verbose
du -h --max-depth=2 /home/hpz440 | sort -rh | head -20

# WSL uses a virtual hard disk (VHD) to store the Linux filesystem:
# C:\Users\<yourname>\AppData\Local\Packages\<DistroName>\LocalState\ext4.vhdx
# This file contains the entire Linux filesystem, so it can grow very large if you have a lot of data in WSL. You can check its size in Windows Explorer or using PowerShell:
# After deleting large files in WSL you need to compact it.


```powershell # with WSL2 version 1.2.0+
wsl --version
wsl --list # find exact distro name
wsl --shutdown # Enter
wsl --manage Ubuntu --set-sparse true

```powershell # if set-sparse doesnt work
wsl --shutdown # Enter
diskpart #Enter -> opens diskpart prompt
select vdisk file="C:\Users\<yourname>\AppData\Local\Packages\<DistroName>\LocalState\ext4.vhdx"
# Enter
attach vdisk readonly
# Enter
compact vdisk
# Enter
detach vdisk
# Enter
exit
```

