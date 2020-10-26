FROM google/dart:latest

# Installing prerequisites
RUN apt-get update && \
	apt-get install -y unzip && \
	apt-get clean
  
# Installing Flutter
RUN git clone -b dev --depth 1 https://github.com/flutter/flutter.git /flutter

ENV PATH $PATH:/flutter/bin

RUN flutter config --enable-web && flutter config --enable-macos-desktop && flutter config --enable-linux-desktop && flutter config --enable-windows-desktop

RUN flutter doctor

COPY . /

ENTRYPOINT ["/entrypoint.sh"]
