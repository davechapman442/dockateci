
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

# Setup container environment for builds
# We'll turn this into a makefile with variables, defaults, warnings and perhaps input if not set!

# We expect the following arguments:

# NAME=name e.g. "Fred Bloggs"
# EMAIL=email e.g. "fred.bloggs@bloggs.com"
# PASSWORD=password e.g. "MySecret"

# Test NAME is set
if [ -z "$NAME" ]; then
    # Error, name is empty
    echo "Name is not set"
    exit
else
    # Variable is not empty
    echo "Name: $NAME"
fi

# Test EMAIL is set
if [ -z "$EMAIL" ]; then
    # Error, email is not set
    echo "Email is not set"
    exit
else
    # Variable is not empty
    echo "Email: $EMAIL"
fi

# Test PASSWORD is set
if [ -z "$PASSWORD" ]; then
    # Error, email is not set
    echo "Password is not set"
    exit
else
    # Variable is not empty
    echo "Password: $PASSWORD"
fi

# Set git config (please supply your user name and email, example below)

echo "Setting up git config"
git config --global user.name  "$NAME"
git config --global user.email "$EMAIL"

# Set your netrc for rdkcentral login

echo "Creating .netrc"
rm -f ~/.netrc
echo "machine code.rdkcentral.com login" $EMAIL "password" $PASSWORD > ~/.netrc
chmod og-rwx ~/.netrc

# Download and install repo
echo "Setting up repo"
mkdir -p ~/bin
rm -f ~/bin/repo
export PATH=~/bin:$PATH

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo

echo "Done you're ready to build!"
