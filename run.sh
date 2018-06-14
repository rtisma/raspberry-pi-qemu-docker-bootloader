#!/bin/bash

docker_image='ryankurte/docker-rpi-emu'
# docker pull
docker pull $docker_image

relative_image_path=$1

# check images exists
if [ ! -e $relative_image_path ]; then
    echo "The image path \"$relative_image_path\" does not exist"
    exit 1
fi
echo "Relative Image Path: $relative_image_path"

abs_image_path=`readlink -f $relative_image_path`
echo "Absolute Image Path: $abs_image_path"

# extract parent directory
image_dir=`dirname $abs_image_path`

# extract filename
image_file=`basename $abs_image_path`

#Run docker
docker run -it --rm --privileged=true -v $image_dir:/usr/rpi/images \
    -p 7777:22 \
    -w /usr/rpi $docker_image /bin/bash  \
    -c "./run.sh images/$image_file /bin/bash"
