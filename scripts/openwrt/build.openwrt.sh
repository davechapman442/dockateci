
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

# Build runes for OpenWRT (24.10) configuration through make menu config

# More instructions here: https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem

# You don't necessary want to run this script, but use for reference only

# Clone the OpenWRT repo
git clone https://git.openwrt.org/openwrt/openwrt.git
cd openwrt
git pull

# Checkout out the 24.10 release
git checkout openwrt-24.10 # (openwrt-23.05 should also work, but supports Banana Pi R3 not R4)

# Update & install feeds (buildroot)
./scripts/feeds update -a
./scripts/feeds install -a

# Configure the build
# More instructions here: https://openwrt.org/docs/guide-developer/toolchain/use-buildsystem#menuconfig
make menuconfig
# Select according to your platform e.g. for Banana Pi R4

# Target = MediaTek ARM
# Sub Target = Filogic 8x0 (MT798x)
# Target Profile = Banana Pi R4 (R3 for 23.05 builds)

# Save, you can cache your .config somewhere if you wish

# Build everything from scratch
make -j1 defconfig download clean world
# Resulting image under bin/target
