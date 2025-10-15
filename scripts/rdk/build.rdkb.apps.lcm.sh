
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
# With RDK Broadband Apps Toolkit using LCM

# MAKE SURE YOU HAVE RUN setup.sh first!!!! see README.dockateci

# You don't necessary want to run this script, but use for reference only

# Grab the manifest
# Banana Pi
# repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests -b rdkb-2025q1-kirkstone -m rdkb-bpi-extsrc.xml
# Raspberry Pi
repo init -u https://code.rdkcentral.com/r/rdkcmf/manifests -m rdkb-extsrc.xml -b rdkb-2025q1-kirkstone 

# Checkout Broadband Apps toolkit
git clone --depth 1 https://github.com/rdkcentral/meta-rdk-broadband-apps.git

# Install local manifest
mkdir -p ./.repo/local_manifests/
cp ./meta-rdk-broadband-apps/manifests/rdkbb-apps-lcm.xml ./.repo/local_manifests/local_manifest.xml

# Checkout build essentials (Yocto 4.0 from OpenEmbedded) and bitbake recipes for everything else
repo sync -j`nproc` --no-clone-bundle # This will pull meta-amx and meta-lcm also

# Banana Pi
# Set the build config & build with bitbake
# MACHINE=bananapi4-rdk-broadband BPI_IMG_TYPE=nand source meta-cmf-bananapi/setup-environment-refboard-rdkb
# Raspberry Pi (32-bit)
MACHINE=raspberrypi4-rdk-broadband source meta-cmf-raspberrypi/setup-environment
# Raspberry pi (64-bit)
# MACHINE=raspberrypi4-64-rdk-broadband source meta-cmf-raspberrypi/setup-environment

# Apply patches
cd ..
# Disable DAC on RPi
cd ./meta-cmf-raspberrypi/ ; patch -p1 < ../patches/meta-cmf-raspberrypi.patch ; cd ..
# Ensure usp-pa depends on RBUS
cd ./meta-rdk-broadband/ ; patch -p1 < ../patches/meta-rdk-broadband.patch ; cd ..
# Add layers (meta-amx, meta-lcm)
cd ./build-raspberrypi4-rdk-broadband/ ; patch -p0 < ../patches/bblayers.patch

# Run bitbake to build the image
bitbake rdk-generic-broadband-image
# tdk
# bitbake rdk-generic-broadband-tdk-image

# See images; ls ./tmp/deploy/images/bananapi4-rdk-broadband/ -l

# NOTE: To build TDK image
# bitbake rdk-generic-broadband-tdk-image
