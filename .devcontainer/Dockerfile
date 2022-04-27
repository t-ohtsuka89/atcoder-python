ARG PYTHON_VERSION=3.8.2
FROM python:${PYTHON_VERSION}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# add non-root user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 

# install node & atcoder-cli
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get install -y nodejs \
  && npm install --global atcoder-cli

# install packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y install --no-install-recommends \
  expect \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# copy `login atcoder script`
COPY .devcontainer/login.sh /usr/local/bin/login.sh

# install requirements with pip.
COPY requirements.txt /tmp/pip-tmp/
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt \
  && rm -rf /tmp/pip-tmp

# copy templates for atcoder-cli
COPY templates/ /home/vscode/.config/atcoder-cli-nodejs/
RUN chown -R vscode:vscode /home/vscode/.config

ENV SHELL /bin/bash