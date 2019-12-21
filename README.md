<div align="center">
  <img src="https://raw.githack.com/redpeacock78/exutils/images/logo.png" alt="ex-utils_logo" width="70%">
</div>

# A collection of commands to make the troublesome one-liner a little easier

Click here for Japanese → [README(JAPANESE)](https://github.com/redpeacock78/exutils/blob/master/doc/README_JAPANESE.md) 

See the [EXAMPLE](https://github.com/redpeacock78/exutils/blob/master/doc/EXAMPLE.md) for detailed usage.

## TOC
<!-- MarkdownTOC -->

- About the concept
- Installation
  - Depends
  - MacOS users
  - Linux users
  - Docker users

<!-- /MarkdownTOC -->


## About the concept

- Commands that were not likely.
- A command written in a Bash script.
- Specializing in command line operation.
- Complex processing can be expressed with just a few characters.

## Installation

### Depends
- bash>=5.0
- awk
- sed(GNU)
- grep(GNU)
- coreutils(GNU)
- findutils(GNU)

<div style="padding:10px;margin-bottom: 10px;border: 1px solid #76acc8;background:#d9edf7;color:#76acc8; border-radius: 15px">
  <b>
    <font color="#76acc8">
      Tips: 
    </font>
  </b>
Install the above and install it with the command corresponding to each of the following after passing through PATH.
</div>

### MacOS users
```sh
$ brew tap redpeacock78/tools
$ brew install exutils

# Uninstall
$ brew uninstall exutils
```
### Linux users
```sh
$ git clone https://github.com/redpeacock78/exutils.git
$ cd exutils
$ ./install.sh

# For zsh, yash, fish, etc., change the .bashrc part accordingly.
$ echo export PATH='$HOME/.exutils/bin:$PATH' >> ~/.bashrc
$ source ~/.bashrc

# Uninstall
$ cd exutils
$ ./install.sh --uninstall
```

### Docker users
```sh
$ docker pull redpeacock78/exutils

# Write the following function in .bashrc etc.
exutils(){
  [ -t 0 ] && T="t" || T=""
  docker run -i$T --rm docker.io/redpeacock78/exutils "$@"
}

# Run!
$ source ~/.bashrc
$ exutils prim -v
prim 0.0.1
Copyright (C) 2019 redpeacock78
License GPLv3+: GNU GPL version3 or later.

THIS IS FREE SOFTWARE.
YOU ARE FREE TO CHANGE AND REDISTRIBUTE IT.
THERE IS NO WARRANTY, TO THE EXTENT PERMITTED BY LAW.

Written by redpeacock78 <https://github.com/redpeacock78>.
```
