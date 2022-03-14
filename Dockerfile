FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-devel

ARG UID
ARG GID
ARG UNAME

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

RUN echo ${GID} ${UID} ${UNAME}
RUN  groupadd -g ${GID} ${UNAME}
RUN useradd -u ${UID} -g ${UNAME} -m ${UNAME}

USER $UNAME
WORKDIR ./working
#build時のPWDは実行したときのディレクトリで、composeにかかれているPWDは/workspaceに移動されている。

RUN pip3 install ipywidgets
RUN pip3 install jupyterlab

RUN pip3 --no-cache-dir install jupyter

USER $UNAME

RUN mkdir /home/tomoki/.jupyter

