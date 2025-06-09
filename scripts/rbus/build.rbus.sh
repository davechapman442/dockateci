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

# Build runes for rbus (v2.3.0 - release) - See: https://github.com/rdkcentral/rbus for further information

export RBUS_ROOT=${HOME}/Builds/RBUS/rbus
export RBUS_INSTALL_DIR=${RBUS_ROOT}/install
# export RBUS_BRANCH=2105_sprint
mkdir -p $RBUS_INSTALL_DIR
cd $RBUS_ROOT

git clone -b v2.3.0 https://github.com/rdkcentral/rbus
cmake -Hrbus -Bbuild/rbus -DCMAKE_INSTALL_PREFIX=${RBUS_INSTALL_DIR}/usr -DBUILD_FOR_DESKTOP=ON -DCMAKE_BUILD_TYPE=Debug
make -C build/rbus && make -C build/rbus install

# Run any rbus commands, set up the environment thus:
#
export RBUS_ROOT=${HOME}/Builds/RBUS/rbus
export RBUS_INSTALL_DIR=${RBUS_ROOT}/install
export PATH=${RBUS_INSTALL_DIR}/usr/bin:${PATH}
export LD_LIBRARY_PATH=${RBUS_INSTALL_DIR}/usr/lib:${LD_LIBRARY_PATH}
