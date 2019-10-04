# Copyright (c) Bo Peng and the University of Texas MD Anderson Cancer Center
# Distributed under the terms of the 3-clause BSD License.


FROM mdabioinfo/sos-notebook:latest

USER  root

RUN apt-get update
RUN apt-get -o Dpkg::Options::="--force-overwrite" install -y  plantuml default-jdk
RUN pip install iplantuml


RUN  cp /usr/share/plantuml/plantuml.jar /usr/local/bin/ 

# Download the kernel release
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip

# Unpack and install the kernel
RUN unzip ijava-kernel.zip -d ijava-kernel \
  && cd ijava-kernel \
  && python3 install.py --sys-prefix
  
COPY  . ${HOME}
RUN   chown -R ${NB_UID} ${HOME}
USER  ${NB_USER}

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

