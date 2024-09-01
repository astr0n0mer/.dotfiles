FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app
VOLUME /app/graph

RUN apt update
# install curl
RUN apt --assume-yes install curl

# install clojure
RUN mkdir /app/clojure && cd $_
RUN curl -L -O https://github.com/clojure/brew-install/releases/latest/download/linux-install.sh
RUN chmod +x linux-install.sh
RUN ./linux-install.sh

# install babashka
RUN mkdir /app/babashka && cd $_
RUN curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
RUN chmod +x install
RUN ./install

# install nvm start
# ====================== WORKING SOLUTION ======================
# Reference: https://stackoverflow.com/a/57344191/7753274
# SHELL ["/bin/bash", "--login", "-i", "-c"]
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# RUN source /root/.bashrc && nvm install 17 && npm install -g corepack && corepack enable
# # run exec bash
# SHELL ["/bin/bash", "--login", "-c"]
# install nvm end

# install git
RUN apt --assume-yes install git

SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
RUN source /root/.bashrc \
    && nvm install 17 \
    && npm install -g corepack \
    && corepack enable \
    && cd /app \
    && git clone https://github.com/logseq/publish-spa \
    && cd publish-spa && yarn install \
    && yarn global add $PWD \
    && cd /app \
    && git clone https://github.com/logseq/logseq \
    && cd logseq \
    && git checkout 0.9.2 \
    && yarn install --frozen-lockfile && yarn gulp:build && clojure -M:cljs release publishing
SHELL ["/bin/bash", "--login", "-c"]
# RUN logseq-publish-spa --help

CMD ["/bin/bash"]
