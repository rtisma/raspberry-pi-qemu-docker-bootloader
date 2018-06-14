# Raspberry PI QEMU Docker Bootloader

### Description 
Simple script, that pulls a docker image, and uses an **existing** raspberry pi image (\*.img)

### Prerequisites
1. [Docker for linux](https://docs.docker.com/install/linux/docker-ce/)
    1. [Docker for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
    2. [Docker for Debian](https://docs.docker.com/install/linux/docker-ce/debian/)
    3. [Docker for Fedora](https://docs.docker.com/install/linux/docker-ce/fedora/)

2. On Linux, ensure `qemu-user-static` is installed

```bash
# For Ubuntu
sudo apt install qemu-user-static

```

### Instructions
1. Download the most recent raspberrian image from https://www.raspberrypi.org/downloads/raspbian/ 
2. Unzip the downloaded zipped image
3. Run the script

```bash

./run.sh ../path/to/img_file

```

### Tricks N' Tips

#### SSH Server not working

As `root` run the following commands

```bash

service ssh start
rm /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

```

Since the `run.sh` forwards the docker container's port 22 to port 7777, you can connecting to the `pi` user:

```bash
ssh -p 7777 pi@localhost

```


