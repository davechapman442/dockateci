
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

# Build runes for RDK-B (2025q1) for the Banana Pi (ref platform) NAND build (SDCARD at some point)

# MAKE SURE YOU HAVE RUN setup.sh first!!!! see README.dockateci

# You don't necessary want to run this script, but use for reference only

# Grab the manifest
repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests -b rdkb-2025q1-kirkstone -m rdkb-bpi-extsrc.xml
# Checkout build essentials (Yocto 4.0 from OpenEmbedded) and bitbake recipes for everything else
repo sync -j`nproc` --no-clone-bundle
# Set the build config & build with bitbake
MACHINE=bananapi4-rdk-broadband BPI_IMG_TYPE=nand source meta-cmf-bananapi/setup-environment-refboard-rdkb
# Run bitbake to build the image
bitbake rdk-generic-broadband-image

# See images; ls ./tmp/deploy/images/bananapi4-rdk-broadband/ -l

# NOTE: To build TDK image
# bitbake rdk-generic-broadband-tdk-image
