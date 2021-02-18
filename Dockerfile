FROM ubuntu:latest

ENV FOUNDRY_HOME=/foundry/foundryvtt
ENV FOUNDRY_DATA=/foundry/foundrydata
ENV FOUNDRY_DOWNLOAD=TEST

RUN apt-get -qq update > /dev/null
RUN apt-get -qq install -y apt-utils > /dev/null
RUN apt-get -qq install -y libssl-dev > /dev/null
RUN apt-get -qq install -y curl > /dev/null
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get -qq install -y nodejs > /dev/null
RUN apt-get -qq install -y unzip > /dev/null
RUN apt-get -qq install -y wget > /dev/null

WORKDIR $FOUNDRY_DATA
WORKDIR $FOUNDRY_HOME

RUN wget -O foundryvtt.zip $FOUNDRY_DOWNLOAD
RUN unzip -o foundryvtt.zip -d /foundry/foundryvtt
RUN rm foundryvtt.zip

ENTRYPOINT echo "Foundry Server Starting" && node resources/app/main.js --dataPath=$FOUNDRY_DATA


