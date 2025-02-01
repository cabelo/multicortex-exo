
![studio_wallpaper2](https://github.com/user-attachments/assets/a30e4ded-1e52-42aa-9341-d9694f5e10f5)

# MultiCortex EXO: AI Cluster OpenSource!

<img align="left" width="240" height="240" src="https://github.com/user-attachments/assets/7d560f98-f7a8-4e3d-a319-2b6f0f9d8a3e">
***MultiCortex EXO*** (https://github.com/exo-explore/exo) is a opensource portable system that can be booted from a USB flash drive, allowing any computer to become a node for creating a decentralized AI framework. It enables the pooling of computing power from multiple devices, leveraging CPUs, GPUs, NPUs, and other accelerators.

Unlike other distributed inference frameworks, exo does not use a master-worker architecture. Instead, exo devices connect peer-to-peer. As long as a device is connected somewhere on the network, it can be used to run models.

The project began with a team of AI researchers and engineers, and as a member of the openSUSE community, I developed this solution so that anyone can create an AI cluster without needing prior knowledge of GNU/Linux or advanced AI techniques.

Based on the openSUSE for Innovators initiative and JAX technology, MultiCortex EXO uses the power of open-source software to democratize access to AI.

Furthermore, the solution prioritizes privacy and control over user data, ensuring that their information is not shared or made available to large corporations.

Contact: Alessandro de Oliveira Faria (A.K.A CABELO) - cabelo@opensuse.org 

### Download and install 

To install MultiCortex EXO on the Linux platform, simply open the terminal and first download the image with the wget command as shown in the example below: 

``` bash
$ wget -O MultiCortex_EXO_1.0.5.x86_64-1.15.6.iso https://sinalbr.dl.sourceforge.net/project/jax-ai/iso/MultiCortex_EXO_1.0.5.x86_64-1.15.6.iso?viasf=1

```

After downloading, plug in the pendrive and run the following command to find out the device name:

 ``` bash
 $ dmesg | grep removable
 [471732.312093] sd 2:0:0:0: [sdb] Attached SCSI removable disk

``` 

To check the capacity and/or more details of the device, run the dmesg command with the newly obtained device name, that is, in the case of the sdb command above:

``` bash
 dmesg |grep sdb
 [471732.312093] sd 2:0:0:0: [sdb] Attached SCSI removable disk
 [471742.325150] sd 2:0:0:0: [sdb] 7866368 512-byte logical blocks: (4.03 GB/3.75 GiB)
 [471742.325895] sd 2:0:0:0: [sdb] Write Protect is off
 [471742.325898] sd 2:0:0:0: [sdb] Mode Sense: 43 00 00 00
 [471742.326365] sd 2:0:0:0: [sdb] No Caching mode page found!

 [471742.326368] sd 2:0:0:0: [sdb] Assuming drive cache: write through

 ```

Now just make the recording on the pendrive with the dd command as root user:

``` bash
 $ sudo dd if=MultiCortex_EXO_1.0.5.x86_64-1.15.6.iso of=/dev/sdb conv=notrunc bs=4M;sync

```
# oneAPI plug and play!
[![Exo3](https://github.com/user-attachments/assets/98b47abc-1a18-4cef-af4a-eab1fb30bcec)](https://www.youtube.com/watch?v=p65bA9IKTYk)
