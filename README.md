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

#### Installing JAVA

1. Ensure you can ssh into your raspberrypi from your docker host. (i.e test with `ssh -p 7777 pi@localhost`)
2. Download the tarball from oracles site
3. Since you had to accept the terms, there is no static url that you can `wget` in your raspberrypi. To transfer the java tarball, simply `scp` it to you raspberryppi using the following command:

```bash
scp -P 7777 /path/to/any/file pi@localhost:/home/pi

```

#### Mounting proc

If the `df -h` command doesnt work, its becaue proc isnt mounted. To mount it just run as root:

```bash
mount -t proc proc proc

```

