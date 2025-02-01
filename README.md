
![image](https://github.com/cabelo/jax/assets/675645/7748562d-e3fb-44de-bf88-4edab703711f)

# JAX  [![Mentioned in Awesome OpenVINO](https://awesome.re/mentioned-badge-flat.svg)](https://github.com/openvinotoolkit/awesome-openvino)

Just an Extended Artificial Intelligence: Artificial intelligence for everyone!

JAX (Just an Artificial Intelligence Extended) is a notable innovation in the field of Artificial Intelligence (AI), designed as an optimized version of the openSUSE Linux image.

**The main goal** of this project is to democratize artificial intelligence by enabling large-scale language models (LLM) and image generation (IAGEN) to run on sixth-generation or newer computers. This is because many people do not have enough financial resources to purchase cutting-edge GPUs.

This platform is meticulously crafted to facilitate access and development of AI applications, representing a significant milestone for researchers, developers, and technology enthusiasts. Its structure is built on the pillars of flexibility and efficiency, providing an ideal environment for exploring the vast and dynamic world of Artificial Intelligence.

The heart of JAX is powered by Intel oneAPI technology, which introduces the concept of heterogeneous computing to the project. This feature allows for seamless integration with a variety of hardware, including products from Intel, NVIDIA, and AMD, offering users the freedom to choose the configuration that best suits their specific needs. 

Furthermore, JAX stands out in the field of Generative Artificial Intelligence, thanks to the incorporation of Intel OpenVINO technology. This technology is compatible with Intel processors and GPUs of the 6th generation or higher, providing exceptional performance and opening new possibilities in the development of AI applications. This set of features places JAX in a unique position, establishing it as a comprehensive and advanced solution for contemporary and future challenges in the field of Artificial Intelligence.

### To Do

- [x] v0.904: First version
- [X] v0.908 : **OpenVINO** plug and play
- [X] ADD Nvidia driver
- [X] oneAPI plug and play 
- [ ] Upgrade to openSUSE 15.6 base
- [ ] ADD ollama inference LLM
- [ ] ADD llama.cpp inference LLM
- [ ] CUDA plug and play
- [ ] ADD Stable Diffusion
- [ ] Stable Diffusion play and play

### Download and install 

To install JAX on the Linux platform, just open the terminal and first download the image using the wget command as shown in the example below:

``` bash
$ wget https://master.dl.sourceforge.net/project/jax-ai/iso/JAX_openSUSE.x86_64-1.15.5-Build-alpha-v0.909.iso
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
 [471742.326365] sd 2:0:0:0: [sdb] No Caching mode page found
 [471742.326368] sd 2:0:0:0: [sdb] Assuming drive cache: write through

 ```

Now just make the recording on the pendrive with the dd command as root user:

``` bash
 $ sudo dd if=JAX_openSUSE.x86_64-1.15.5-Build-alpha-v0.909.iso of=/dev/sdb conv=notrunc bs=4M;sync

```
# oneAPI plug and play!
[![image](https://github.com/user-attachments/assets/047ebab2-5cc3-4ac5-ab35-43bd1bad843b)](https://www.youtube.com/watch?v=IaVxDZA2ygI)

# Boot Demonstrative video:
[![image](image/jax-demo-alpha-001.jpg)](https://www.youtube.com/watch?v=Nt020MmX_00)

# Video demonstrating AI running on old computers:
[![image](https://github.com/cabelo/jax/assets/675645/dc038d9c-0ba3-4ef2-b396-adcc4cd12783)](https://www.youtube.com/watch?v=BfMqMBqLkzw)

# Linux Pilot demonstration video:
[![image](https://github.com/cabelo/jax/assets/675645/68b5ca80-6934-4211-ab4e-df45ca7f6ece)](https://www.youtube.com/watch?v=tH99PUmUou8)







