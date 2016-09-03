# usage: docker run kannix/monero-miner -a cryptonight -u user -p password
# ex: docker run kannix/monero-miner -a cryptonight -o stratum+tcp://mine.moneropool.com:3333 -u 49UEAnmaUCVP5Bpwb6jaHBSitibgqfyT9jYSu35ZTWwA4ybXXaZYeQA8Qy6hJPq8j9RRyZ5CtNuytGHFxAYJdSkaGaqSgS6 -p x --threads 4

FROM		ubuntu:latest

RUN		apt-get update -qq && apt-get install -qqy \
  automake \
  libcurl4-openssl-dev \
  git \
  make \
  build-essential

RUN		git clone https://github.com/wolf9466/cpuminer-multi

RUN		cd cpuminer-multi && ./autogen.sh && ./configure CFLAGS="-O3" && make

WORKDIR		/cpuminer-multi
ENTRYPOINT	["./minerd"]
