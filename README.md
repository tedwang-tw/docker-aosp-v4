docker-aosp-v4
==============

Docker image for building [Android Open Source Project (AOSP)](https://android.googlesource.com/ "Android Open Source Project (AOSP)") Kitkat (4.4.x) and older verions.

Note: For newer versions, e.g. Lollipop, please check [tedwang-tw/docker-aosp-v5](https://github.com/tedwang-tw/docker-aosp-v5 "tedwang-tw/docker-aosp-v5").

## Installation ##
Pull the image from the [Docker Hub](https://registry.hub.docker.com/u/tedwang/aosp-v4/ "Docker Hub"). This is the recommended method of installation as it is easier to update image.

    docker pull tedwang/aosp-v4:latest

Note: For original monolithic build, you should pull by another tag **aosp-v4:monolithic**.

Alternately you can build the image locally.

    git clone https://github.com/tedwang-tw/docker-aosp-v4.git
    cd docker-aosp-v4
    docker build -t tedwang/aosp-v4 .

Here you can swap the base image with either **tedwang/aosp-base12** or **-base14** by manually modifying "FROM" command in Dockerfile.

## Usage ##
You can launch the image using the docker command line, suppose you have prepared a folder for aosp download in the local host, e.g. **~/AOSP**,

    docker run --name='aosp-v4' -it --rm \
    -v ~/AOSP:/home/android/aosp \
    tedwang/aosp-v4 \
    /bin/bash

The **/home/android/aosp** is the mounted point inside the container.

After entering the container, you can operate as the normal developing:

    0 android@ ~ $ cd aosp
    0 android@ ~/aosp $ git config --global user.email "name@example.com"
    0 android@ ~/aosp $ git config --global user.name "My Name"
    0 android@ ~/aosp $ repo init -u https://android.googlesource.com/platform/manifest
    0 android@ ~/aosp $ repo sync
    0 android@ ~/aosp $ source build/envsetup.sh
    0 android@ ~/aosp $ lunch ......

## Pre-Configured ##
- Ubuntu 12.04
- Default user account: name=**android**, password=**android**
- Toolchains as from [http://source.android.com/source/initializing.html](http://source.android.com/source/initializing.html)
- Repo tool as from [http://source.android.com/source/downloading.html](http://source.android.com/source/downloading.html)
 
 
## Todo ##

- Setup for ccache
- <s>Separate base image</s>

## ChangeLog ##
- 2014-11-15
	- Created branch "[monolithic](https://github.com/tedwang-tw/docker-aosp-v4/tree/monolithic "monolithic")" for no separated base image build
	- "[master](https://github.com/tedwang-tw/docker-aosp-v4/tree/master "master")" branch now includes the separated base image
