
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

# Build runes for RDK-V (6.1.0) for Raspberry Pi R4

# You don't necessary want to run this script, but good for reference

# From: https://wiki.rdkcentral.com/pages/viewpage.action?spaceKey=RDK&title=Raspberry+Pi+4+RDK6.1+Release+Notes

# NOTE: To build RDKV 6.1 you must be an RDK Licensee (https://wiki.rdkcentral.com/display/RDK/Licensees)
# From RDK 7 onwards the Reference Board build (presently Raspberry Pi 4) will be fully Open Source

# You must use your Personal Access Token (PAT) as your password

# Grab the manifest
repo init -u https://code.rdkcentral.com/r/manifests -b 6.1.0 -m rdkv-extsrc.xml
# Check build essentials, layers and recipes
repo sync --no-clone-bundle --no-tags
# Set the build config & build with bitbake
MACHINE=raspberrypi4-64-rdk-android-hybrid source meta-cmf-raspberrypi/setup-environment
# Run bitbake to build the image
bitbake lib32-rdk-generic-hybrid-wpe-image
  
# To build tdk image
bitbake lib32-rdk-generic-hybrid-wpe-tdk-image
