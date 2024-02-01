# syntax=docker/dockerfile:1
FROM condaforge/miniforge3

# Install commonly used packages. Need system-wide python for some scripts in chipyard. 
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install less vim nano python3 -y

# Clone the chipyard repo
RUN git clone https://github.com/ucb-bar/chipyard /opt/chipyard

# Move to commit specified in Lab1 instructions
WORKDIR /opt/chipyard
RUN git checkout main
RUN git reset --hard 150f888

# Install chipyard pre-reqs in conda
RUN conda install -n base conda-libmamba-solver
RUN conda config --set solver libmamba
RUN conda install -n base conda-lock==1.4.0

# Simple wrapper script for build-setup.sh, to build and install needed components 
COPY --chown=root:root --chmod=755 install-chipyard.sh /opt/chipyard/install-chipyard.sh
RUN  ./install-chipyard.sh
RUN rm ./install-chipyard.sh

# Set up enviornment variables and source env.sh in bashrc
ENV CHIPYARDROOT=/opt/chipyard 
ENV BMARKS=$CHIPYARDROOT/generators/riscv-sodor/riscv-bmarks
ENV SCRIPTS=$CHIPYARDROOT/generators/riscv-sodor/scripts
RUN echo "source /opt/chipyard/env.sh" >> /root/.bashrc

CMD ["/usr/bin/bash"]
