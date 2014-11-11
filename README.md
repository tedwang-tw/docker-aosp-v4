docker-aosp-v4
==============

Docker image for building [Android Open Source Project (AOSP)](https://android.googlesource.com/ "Android Open Source Project (AOSP)") Kitkat (4.4.x) and older verions.

## Installation ##
Pull the image from the docker hub. This is the recommended method of installation as it is easier to update image.


    docker pull tedwang/docker-aosp-v4:latest

Alternately you can build the image locally.

    git clone https://github.com/tedwang-tw/docker-aosp-v4.git
    cd docker-aosp-v4
    docker build -t tedwang/docker-aosp-v4 .
    
## Usage ##
You can launch the image using the docker command line, suppose you have prepared a folder for aosp download in the local host, e.g. ~/AOSP/,

    docker run --name='aosp-v4' -it --rm \
    -v ~/AOSP:/home/android/aosp \
    tedwang/docker-aosp-v4 \
    /bin/bash

The /home/android/aosp is the mounted point inside the container.

## Pre-Configured ##
- Ubuntu 12.04
- Default user account: name=android, password=android
- Toolchains as from [http://source.android.com/source/initializing.html](http://source.android.com/source/initializing.html)
- Repo tool as from [http://source.android.com/source/downloading.html](http://source.android.com/source/downloading.html)
 
 
## Todo ##
