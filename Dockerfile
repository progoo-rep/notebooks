FROM beakerx/beakerx

USER  root

ENV PATH /opt/conda/envs/beakerx/bin:$PATH

RUN apt-get update
RUN apt-get  install -y  plantuml 
RUN  cp /usr/share/plantuml/plantuml.jar /usr/local/bin/ 

# update pip
RUN pip install --no-cache-dir --upgrade pip

#RUN /bin/bash -c ". activate beakerx && \
#    pip install iplantuml"

USER $NB_USER
