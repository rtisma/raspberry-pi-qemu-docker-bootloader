#!/bin/bash

docker_image='ryankurte/docker-rpi-emu'
# docker pull
docker pull $docker_image

relative_image_path=$1


#  relative_data_dir=$2
#  echo "Relative Data Dir: $relative_data_dir"
#  if [ -z $relative_data_dir ]; then
#      echo "The data directory \"$relative_data_dir\" was not defined"
#      exit 1
#  elif [ ! -e $relative_data_dir ]; then
#      echo "The data directory \"$relative_data_dir\" does not exist"
#      exit 1
#  elif [ ! -d $relative_data_dir ]; then
#      echo "The data directory \"$relative_data_dir\" is not a directory"
#      exit 1
#  fi
#  absolute_data_dir=`readlink -f $relative_data_dir`
#  echo "Absolute Data Path: $absolute_data_dir"

# check images exists
if [ -z $relative_image_path ]; then
    echo "The image path \"$relative_image_path\" was not defined"
    exit 1
elif [ ! -e $relative_image_path ]; then
    echo "The image path \"$relative_image_path\" does not exist"
    exit 1
elif [ ! -f $relative_image_path ]; then
    echo "The image path \"$relative_image_path\" is not a file"
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
docker run -it --rm --privileged=true \
    -v $image_dir:/usr/rpi/images \
    -p 7777:22 \
    -w /usr/rpi $docker_image /bin/bash  \
    -c "./run.sh images/$image_file /bin/bash"
