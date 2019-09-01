![ex-utils_logo](https://github.com/redpeacock78/exutils/blob/images/logo.png)
# A collection of commands to make the troublesome one-liner a little easier

See the [EXAMPLE](https://github.com/redpeacock78/exutils/blob/master/doc/EXAMPLE.md) for detailed usage.

## TOC
<!-- MarkdownTOC -->

- About the concept
- Installation
	- Depends
	- MacOS users
	- Linux users

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
```console
$ brew tap redpeacock78/tools
$ brew install exutils
```
### Linux users
```console
$ git clone https://github.com/redpeacock78/exutils.git $HOME/exutils
$ echo export PATH='$HOME/exutils:$PATH' >> ~/.bashrc
(For zsh, yash, fish, etc., change the .bashrc part accordingly.)
```
