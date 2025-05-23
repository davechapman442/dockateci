
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

# Build runes for OBUSPA (v10.0.0) native build
# See: https://github.com/BroadbandForum/obuspa/ for a wealth of info on OBUSPA

# You don't necessary want to run this script, but use for reference only (Although this one should work fine!)

# Checkout, build and install a recent libwebsocket (4.2.0) at least is required so taking the best point release (4.2.2)
git clone https://github.com/warmcat/libwebsockets.git libwebsockets
cd libwebsockets
git checkout v4.2.2 # Best point release at required version
cmake . # Configure
make # Build & Install
sudo make install
cd ..

# Checkout, build and install obuspa (10.0.0)
git clone https://github.com/BroadbandForum/obuspa.git
cd obuspa
git checkout v10.0.0-master
autoreconf --force --install # Automake and configure
./configure
make # Build and Install
sudo make install
cd ..

