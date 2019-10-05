FROM beakerx/beakerx

USER  root

RUN apt-get update
RUN apt-get  install -y  plantuml 
RUN  cp /usr/share/plantuml/plantuml.jar /usr/local/bin/ 

#ENV LANG=en_US.UTF-8
#ENV LC_CTYPE=en_US.UTF-8
#ENV LC_ALL=en_US.UTF-8
#ENV REMOVE_DASH_LINECOMMENT="true"
#ENV SHELL /bin/bash
#ENV NB_UID 1000
#ENV HOME /home/$NB_USER

#USER $NB_USER

#EXPOSE 8888

#ENV PATH /opt/conda/bin:$PATH
#RUN pip  install --user iplantuml

#RUN /bin/bash -c ". activate beakerx && \
#    pip install iplantuml"

CMD ["start-notebook.sh"]
