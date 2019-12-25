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
  - Dependencies
  - MacOS users
  - Linux users
  - Docker users
- I want to use it easily without installing :-)
  - Dependencies
  - Method

<!-- /MarkdownTOC -->


## About the concept

- Commands that were not likely.
- A command written in a Bash script.
- Specializing in command line operation.
- Complex processing can be expressed with just a few characters.

## Installation

### Dependencies
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
# Install
$ brew tap redpeacock78/tools
$ brew install exutils

# Uninstall
$ brew uninstall exutils
```
### Linux users
```sh
# Install
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
When installing using Docker, there is no need to install [Dependencies](#Dependencies).
```sh
# Install
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

# Update
$ docker pull redpeacock78/exutils && docker rmi -f $(docker images | grep docker.io/redpeacock78/exutils | grep none | awk '{print $3}')

# Uninstall
$ docker rmi -f $(docker images | grep docker.io/redpeacock78/exutils | grep latest | awk '{print $3}')
```

## I want to use it easily without installing :-)
When using without installation, the following items are required in addition to [Dependencies at installation](#Dependencies).

### Dependencies
- Internet connection
- curl

### Method
```sh
# For temporary use.
$ bash <(curl -s https://raw.githubusercontent.com/redpeacock78/exutils/master/bin/ngram) 御旗のもとに
御旗のもとに御
旗のもとに御旗
のもとに御旗の
もとに御旗のも
とに御旗のもと
に御旗のもとに

# If you want to use it permanently.
# Write the following in .bashrc etc.
exutils(){
  if [[ "${1}" == help ]] || \
     [[ "${@}" == version ]]; then
    bash <(curl -s "https://raw.githubusercontent.com/redpeacock78/exutils/master/docker/bin/${1}") "${2}"
  else
    bash <(curl -s "https://raw.githubusercontent.com/redpeacock78/exutils/master/bin/${1}") "${@:2}"
  fi
}

# Reload settings.
$ source ~/.bashrc

# Run!
$ exutils prim -w 100 | exutils camb 13
02 03 05 07 11 13 17 19 23 29 31 37 41
03 05 07 11 13 17 19 23 29 31 37 41 43
05 07 11 13 17 19 23 29 31 37 41 43 47
07 11 13 17 19 23 29 31 37 41 43 47 53
11 13 17 19 23 29 31 37 41 43 47 53 59
13 17 19 23 29 31 37 41 43 47 53 59 61
17 19 23 29 31 37 41 43 47 53 59 61 67
19 23 29 31 37 41 43 47 53 59 61 67 71
23 29 31 37 41 43 47 53 59 61 67 71 73
29 31 37 41 43 47 53 59 61 67 71 73 79
31 37 41 43 47 53 59 61 67 71 73 79 83
37 41 43 47 53 59 61 67 71 73 79 83 89
41 43 47 53 59 61 67 71 73 79 83 89 97
```