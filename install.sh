#!/usr/bin/env bash


function ascii(){
  {
   cat << ASCII

################################
                   __  _ __    
  ___  _  ____  __/ /_(_) /____
 / _ \| |/_/ / / / __/ / / ___/
/  __/>  </ /_/ / /_/ / (__  ) 
\___/_/|_|\__,_/\__/_/_/____/

################################

Installing Start ...
ASCII
  }
}
                            
function install(){
  {
   mkdir -p ~/.exutils/bin && \
   cp /home/exutils/bin/* ~/.exutils/bin
  }
}

function docker(){
  {
   cp /home/exutils/docker/bin/* ~/.exutils/bin
  }
}

function path(){
  {
   cat << "PATH"

Add ~/.exutils/bin to your $PATH for access to the exutils command-line utility.

For bash:
echo 'export PATH="$HOME/.exutils/bin:$PATH"' >> ~/.bashrc

For zsh:
echo 'export PATH="$HOME/.exutils/bin:$PATH"' >> ~/.bashrc
PATH
  }
}

function usage(){
  {
   cat << EOS >&2
Usage: install.sh [--docker] [-h,--help]
EOS
  }
}

function error(){
  {
   cat << EOS >&2
Error.
Refer '${0##*/} -h' or '${0##*/} --help' for how to use the command.
EOS
  } 
}

function separete_opt(){
  if [[ -z "${@}" ]]; then
  	ascii && \
    install && \
    path
  elif [[ "${@}" == --docker ]]; then
  	ascii && \
  	install && \
  	docker && \
  	path
  elif [[ "${@}" == -h ]]|| \
       [[ "${@}" == --help ]]; then
    usage
  else
    error
  fi
}

separete_opt "${@}"