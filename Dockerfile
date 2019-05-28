FROM anapsix/alpine-java

ENV SONAR_SCANNER_VERSION 3.2.0.1227

RUN apk add --update ca-certificates openssl curl nodejs unzip

WORKDIR /root

RUN wget -O /root/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip

RUN unzip sonar-scanner.zip

RUN ls -l 

RUN mv /root/sonar-scanner-${SONAR_SCANNER_VERSION}-linux /root/sonar-scanner
RUN rm /root/sonar-scanner.zip

RUN apk update
RUN apk add git
RUN wget https://dl.google.com/go/go1.11.linux-amd64.tar.gz
RUN tar -xvf go1.11.linux-amd64.tar.gz
RUN mv go /usr/local
RUN export GOROOT=/usr/local/go && export GOPATH=$HOME/go && export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
RUN ln -s /usr/local/go/bin/go /bin/go
RUN ln -s /root/sonar-scanner/bin/sonar-scanner /bin/sonar-scanner
RUN go version && go env

