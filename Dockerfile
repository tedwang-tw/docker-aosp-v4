FROM ubuntu:12.04

MAINTAINER tedwang.tw@gmail.com

#
# fundamental packages
#
RUN apt-get update \
	&& apt-get install -y curl vim git
# optional
#RUN apt-get install -y wget sudo net-tools 

#
# AOSP requirement depends on android versions
#
# Java
# Add oracle-jdk6
RUN apt-get update
RUN apt-get install python-software-properties -y
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install oracle-java6-installer -y
RUN apt-get install oracle-java6-set-default -y
ENV JAVA_HOME /usr/bin/java
ENV PATH $JAVA_HOME:$PATH
# GCC 
RUN apt-get install -y gnupg flex build-essential \
	zip libc6-dev libncurses5-dev:i386 x11proto-core-dev \
	libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
	libgl1-mesa-dev mingw32 tofrodos \
	python-markdown xsltproc zlib1g-dev:i386
RUN apt-get install -y bison g++-multilib gperf libxml2-utils
RUN ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so

# Clean up
RUN apt-get clean

#
# user account
#
ENV MYNAME android
ENV MYPASS android
ENV HOME /home/$MYNAME
#RUN mkdir -p $HOME

RUN echo "User: android Pass: $MYPASS"
RUN useradd --create-home -d $HOME --shell /bin/bash --user-group --groups adm,sudo $MYNAME
RUN echo "$MYNAME:$MYPASS" | chpasswd

USER $MYNAME
WORKDIR $HOME

#VOLUME ["$HOME/aosp"]

# shell prompt
ENV PS1 "\$(if [[ \$? == 0 ]]; then echo '\[\033[0;32m\]'; else echo '\[\033[0;31m\]'; fi)\$? \$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\u'; else echo '\[\033[0;34m\]\u@'; fi)\[\033[0;33m\] \w \[\033[0;32m\]\$\[\033[00m\] "
RUN echo export PS1="$PS1" >> ~/.bashrc

#
# AOSP Repo tool
#
RUN mkdir ~/bin
ENV PATH ~/bin:$PATH

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
RUN chmod a+x ~/bin/repo

