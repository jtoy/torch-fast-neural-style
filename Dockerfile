FROM somatic/k802x
#FROM kaixhin/cuda-torch
ENV DEBIAN_FRONTEND noninteractive

RUN /home/ubuntu/torch/install/bin/luarocks install loadcaffe
RUN pip install boto flask jinja2 markupsafe werkzeug futures itsdangerous requests wsgiref pyyaml py-cpuinfo

RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install torch
RUN /home/ubuntu/torch/install/bin/luarocks install image
RUN /home/ubuntu/torch/install/bin/luarocks install lua-cjson
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install nn
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cutorch
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cunn
RUN cd /tmp && wget http://cl.ly/11103u2s2N3G/cudnn-7.0-linux-x64-v3.0-prod.tgz
RUN cd /usr/local &&tar xzvf /tmp/cudnn-7.0-linux-x64-v3.0-prod.tgz
RUN ldconfig
RUN export CUDA_TOOLKIT_ROOT_DIR="/usr/local/cuda" && /home/ubuntu/torch/install/bin/luarocks install cudnn

#ADD * /home/ubuntu/experiment/    <--- this should work,its a bug with docker https://github.com/docker/docker/issues/18396
ADD .docker-experimentconfig /home/ubuntu/experiment/.experimentconfig
