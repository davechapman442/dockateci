
# MIT License
# 
# Copyright (c) 2025 Dave Chapman
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Default rule (all)
all:

# Set build folder and Dockerfile name
WORKDIR 	?= ${PWD}/Builds

RDKB_DIR 	:= ${WORKDIR}/RDKB
RDKV_DIR	:= ${WORKDIR}/RDKV

OPENWRT_DIR 	:= ${WORKDIR}/OpenWRT
PRPLOS_DIR	:= ${WORKDIR}/prplOS

DOCKERFILE 	:= Dockerfile
IMAGE		:= dockateci-ubuntu-20-04

# Setup and build files
SETUP := \
	${WORKDIR}/setup.sh \
	${WORKDIR}/README.dockateci \
	${RDKB_DIR}/build.rdkb.sh \
	${RDKV_DIR}/build.rdkv.sh \
	${OPENWRT_DIR}/build.openwrt.sh \
	${PRPLOS_DIR}/build.prplos.sh \
	${PRPLOS_DIR}/bpi_r3.yml \
	${PRPLOS_DIR}/bpi_r4.yml

# Create build folder and general help files
${WORKDIR}:
	mkdir -p ${WORKDIR}

${WORKDIR}/README.dockateci: ${WORKDIR} README.md
	cp README.md $@

# Create target build folders and copy over build scripts

# General setup (for all builds)
${WORKDIR}/setup.sh: ${WORKDIR} scripts/setup.sh
	cp scripts/setup.sh $@

# RDKB
${RDKB_DIR}:
	mkdir -p ${RDKB_DIR}

${RDKB_DIR}/build.rdkb.sh: ${RDKB_DIR} scripts/rdk/build.rdkb.sh
	cp scripts/rdk/build.rdkb.sh $@

# RDKV
${RDKV_DIR}:
	mkdir -p ${RDKV_DIR}

${RDKV_DIR}/build.rdkv.sh: ${RDKV_DIR} scripts/rdk/build.rdkv.sh
	cp scripts/rdk/build.rdkv.sh $@

# OpenWRT
${OPENWRT_DIR}:
	mkdir -p ${OPENWRT_DIR}

${OPENWRT_DIR}/build.openwrt.sh: ${OPENWRT_DIR} scripts/openwrt/build.openwrt.sh
	cp scripts/openwrt/build.openwrt.sh $@

# prplOS
${PRPLOS_DIR}:
	mkdir -p ${PRPLOS_DIR}

${PRPLOS_DIR}/build.prplos.sh: ${PRPLOS_DIR} scripts/prplos/build.prplos.sh
	cp scripts/prplos/build.prplos.sh $@

${PRPLOS_DIR}/bpi_r3.yml: ${PRPLOS_DIR} scripts/prplos/yml/bpi_r3.yml
	cp scripts/prplos/yml/bpi_r3.yml $@

${PRPLOS_DIR}/bpi_r4.yml: ${PRPLOS_DIR} scripts/prplos/yml/bpi_r4.yml
	cp scripts/prplos/yml/bpi_r4.yml $@

# Dockerfile from template, just a copy for now may have subfiles/templates later
# Copies license header too which might not be ideal (meh)
${DOCKERFILE}: Dockerfile.template
	cp $< $@

# Convenience target (You don't have to use this, just copy the command if preferred)
image: ${DOCKERFILE}
	docker build -t ${IMAGE} .
	docker image ls | grep dockateci

image_rm:
	docker image rm ${IMAGE}

# Convenience target (You don't have to use this, just copy the command if preferred)
run: ${WORKDIR}
	docker run -it --rm --mount type=bind,src=${WORKDIR},dst=/home/dockateci/Builds --mount type=bind,src=${HOME}/.ssh,dst=/home/dockateci/.ssh ${IMAGE}

# Clean it all up!
clean:
	rm -rf ${WORKDIR} ${DOCKERFILE}

clean_scripts:
	rm -f ${SETUP}

# Build docker file and setup host Build folder to be bind mounted to container
all: ${DOCKERFILE} ${SETUP}
