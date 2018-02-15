FROM ubuntu:16.04
MAINTAINER sujay@skillenza.com

RUN apt-get update -o Acquire::CompressionTypes::Order::=gz
RUN apt-get install -y software-properties-common python-software-properties \
&& add-apt-repository ppa:jonathonf/python-3.6 \
&& apt-get update

# install all the dependencies
RUN apt-get install -y python3.6 python3.6-dev python3-pip python3.6-venv

# Setup Python3.6 by default replacing 3.5
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1 \
# && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2 \
# && update-alternatives --config python3 --skip-auto

RUN ln -sfn /usr/bin/python3.6 /usr/bin/python3 && ln -sfn /usr/bin/python3 /usr/bin/python && ln -sfn /usr/bin/pip3 /usr/bin/pip

# install git
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade \
&& python3.6 -m pip install wheel

RUN rm -rf /var/lib/apt/lists/* \
&& apt-get clean
