FROM ubuntu:22.04

# Install base utilities
RUN apt-get update && \
    apt-get install -y build-essential  && \
    apt-get install -y wget git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda

ENV PATH=$CONDA_DIR/bin:$PATH

RUN conda init bash

RUN CONDA_OVERRIDE_CUDA='11.7' conda create \
    -n neuro \
    -c pytorch -c conda-forge -c nvidia \
    python=3.9 pip pytorch=1.13 pytorch-cuda=11.7 torchvision torchaudio

SHELL ["conda", "run", "-n", "neuro", "--no-capture-output", "/bin/bash", "-c"]

RUN git clone https://github.com/Kepler-Br/omega-momiji-neural-networks-services.git /content && \
    cd /content && \
    git checkout 4867a7cf && \
    rm -rf .git

WORKDIR /content/text-generator/src

RUN pip install -r ../requirements.txt

ENTRYPOINT ["conda", "run", "-n", "neuro", "--no-capture-output"]
