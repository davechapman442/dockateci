
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

# Build runes for prplOS (3.2.0) for Banana Pi R3; R4 support coming in prplOS (4.1.0)
# We'll turn this into a makefile with variables, defaults, warnings and perhaps input if not set!

# More useful info here: https://holisticon.pl/blog/how-to-set-up-prplos-on-banana-pi-r3-a-step-by-step-guide/

# You don't necessary want to run this script, but good for reference

# Clone the prplOS repo
git clone git@gitlab.com:prpl-foundation/prplos/prplos.git
# You must have shared your public key with gitlab (Gitlab user preferences)
# You host .ssh folder will be available (bind mounted) into the dockateci container home
# If it works on the host, then it should work here!
cd prplos

# Checkout out the 3.2.0 release
git checkout 3.2.0
# Copy in the Banana Pi profile definitions
# R4 due to work in prpl OS 4.1.0 (in theory)
# R3 functional in prpl OS 3.2.0
cp ../*.yml ./profiles

# Check the Banana Pi R3 profile is available
./scripts/gen_config.py list | grep banana

# Configure the build (bpi R3 target, with prpl OS base, debug build)
./scripts/gen_config.py bpi_r3 prpl debug  

# When finished you can check the result .config is correct
cat .config | grep mediatek | grep -v '#'

# Which should be:
# CONFIG_TARGET_mediatek=y
# CONFIG_TARGET_mediatek_filogic=y
# CONFIG_TARGET_mediatek_filogic_DEVICE_bananapi_bpi-r3=y
# CONFIG_TARGET_BOARD="mediatek"

# And now build:
make -j$(nproc)

# Or simply make, if you don't want to fully occupy your machine/build machine
# In case of failures, a more verbose make can be invoked thus:
make -j1 V=sc

# If successful build files are found thus (as with OpenWRT):
ls -1 ./bin/targets/mediatek/filogic

