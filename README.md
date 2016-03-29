# Intructions for Fedora 23

## How to install swift(and its dependencies)

``` bash

curl https://github.com/Zialus/swift-rpm/releases/download/swift-3.0-DEVELOPMENTSNAPSHOT20160301a/swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm -O -L
sudo dnf install libbsd python libicu clang
sudo rpm -Uvh swift-3.0-DEVELOPMENTSNAPSHOT20160301a.x86_64.rpm

```

## How to install the 8-puzzle-solver

``` bash

git clone https://github.com/Zialus/TikTakToe.git
cd TikTakToe
swift build

```

## How to run it

``` bash

./.build/debug/TikTakToe

```
