FROM mdabioinfo/sos-notebook@sha256:4e085e56d81cef438b6909bf41ec192d5781c20f80b2a7b716a48e2f89f25d82


MAINTAINER Bo Peng <bpeng@mdanderson.org>

RUN pip3 install --no-cache-dir sos-java iplantuml

USER  root
COPY  . ${HOME}
RUN   chown -R ${NB_UID} ${HOME}
USER  ${NB_USER}

# Specify the default command to run
CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]


#FROM openjdk:11.0.3-jdk

#RUN apt-get update
#RUN apt-get install -y python3-pip plantuml

# add requirements.txt, written this way to gracefully ignore a missing file
#COPY . .
#RUN ([ -f requirements.txt ] \
#    && pip3 install --no-cache-dir -r requirements.txt) \
#        || pip3 install --no-cache-dir jupyter jupyterlab

#USER root

# Download the kernel release
#RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip

# Unpack and install the kernel
#RUN unzip ijava-kernel.zip -d ijava-kernel \
#  && cd ijava-kernel \
#  && python3 install.py --sys-prefix

# Set up the user environment

#ENV NB_USER jovyan
#ENV NB_UID 1000
#ENV HOME /home/$NB_USER

#RUN adduser --disabled-password \
#    --gecos "Default user" \
#    --uid $NB_UID \
#    $NB_USER

#COPY . $HOME
#RUN chown -R $NB_UID $HOME

#USER $NB_USER

# Launch the notebook server
#WORKDIR $HOME

#CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
