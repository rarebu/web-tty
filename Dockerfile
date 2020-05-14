FROM phusion/baseimage
RUN groupadd -g 999 appuser && useradd -r -u 999 -g appuser appuser
RUN apt-get update && apt-get -o Dpkg::Options::='--force-confold' --force-yes -fuy dist-upgrade
RUN apt-get install python2.7 git tmux wget -y
RUN mkdir /home/appuser/ && chown -R appuser:appuser /home/appuser/
RUN cd /root && wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz
RUN tar -zxvf /root/go1.9.2.linux-amd64.tar.gz -C /usr/local/
RUN export PATH=$PATH:/usr/local/go/bin
RUN /usr/local/go/bin/go get github.com/yudai/gotty
#USER appuser
#RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#USER root
#RUN /home/appuser/.linuxbrew/bin/brew install yudai/gotty/gotty
CMD /bin/sh
#/root/go/bin/gotty
#sudo docker run -it -p 8080:8080 test:10
#CMD /root/go/bin/gotty tmux new -A -s gotty top