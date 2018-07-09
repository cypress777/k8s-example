FROM gcc:latest
RUN mkdir /usr/src/mytest
COPY test.out /usr/src/mytest
WORKDIR /usr/src/mytest
CMD ["./test.out"]
