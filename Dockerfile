FROM beakerx/beakerx 

USER  root
RUN apt-get update
RUN apt-get  install -y  plantuml 
RUN  cp /usr/share/plantuml/plantuml.jar /usr/local/bin/ 

# update pip
#RUN pip install --no-cache-dir --upgrade pip

ENV PATH /opt/conda/envs/beakerx/bin:$PATH

RUN /bin/bash -c ". activate beakerx && \
    pip install iplantuml"
    
COPY POO /home/beakerx/POO
RUN chown -R  beakerx:beakerx POO

USER $NB_USER
