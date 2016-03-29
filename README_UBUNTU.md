# Intructions for Ubuntu 14.04

## How to install swift

```bash

sudo apt-get install clang-3.6
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100

wget -qO- http://dev.iachieved.it/iachievedit.gpg.key | sudo apt-key add -
echo "deb http://iachievedit-repos.s3.amazonaws.com/ trusty main" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get install swift-2.2

```

## How to install the 8-puzzle-solver

```bash
git clone https://github.com/Zialus/8-puzzle-TikTakToe.git
cd TikTakToe
swift build
```

## How to run it

```bash
./.build/debug/TikTakToe
```