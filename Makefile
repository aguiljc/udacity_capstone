
## The Makefile includes instructions on environment setup and lint tests
# Dockerfile should pass hadolint

install:
	wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && \
	  chmod +x /bin/hadolint

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile

all: install lint