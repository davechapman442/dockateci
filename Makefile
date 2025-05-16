
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
WORKDIR ?= ${PWD}/Builds
DOCKERFILE := Dockerfile

# Setup and build files
SETUP := ${WORKDIR}/setup.sh ${WORKDIR}/build.sh

${WORKDIR}:
	mkdir -p ${WORKDIR}

${WORKDIR}/setup.sh: ${WORKDIR}
	cp setup.sh ${WORKDIR}

${WORKDIR}/build.sh: ${WORKDIR}
	cp build.sh ${WORKDIR}

# Dockerfile from template, just a copy for now may have subfiles/templates later
# Copies license header too which might not be ideal (meh)
${DOCKERFILE}: Dockerfile.template
	cp $< $@

# Convenience target (You don't have to use this, just copy the command if preferred)
image: ${DOCKERFILE}
	docker build -t rdkb-ubuntu-20-04 .

# Convenience target (You don't have to use this, just copy the command if preferred)
run: ${WORKDIR}
	docker run -it --rm --mount type=bind,src=${WORKDIR},dst=/home/rdkb/Builds rdkb-ubuntu-20-04

# Clean it all up!
clean:
	rm -rf ${WORKDIR} ${DOCKERFILE}

# Build docker file and setup host Build folder to be bind mounted to container
all: ${DOCKERFILE} ${SETUP}


