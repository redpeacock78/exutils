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

ASCII
  }
}
                            
function install(){
  {
   mkdir -p ~/.exutils/bin && \
   cp ~/exutils/bin/* ~/.exutils/bin
  }
}

function docker(){
  {
   cp ~/exutils/docker/bin/* ~/.exutils/bin
  }
}

function uninstall(){
 {
  rm -rf ~/.exutils
 }
}

function path(){
  {
   cat << "PATH"

Add ~/.exutils/bin to your $PATH for access to the exutils command-line utility.

For bash:
echo 'export PATH="$HOME/.exutils/bin:$PATH"' >> ~/.bashrc

For zsh:
echo 'export PATH="$HOME/.exutils/bin:$PATH"' >> ~/.zshrc

PATH
  }
}

function usage(){
  {
   cat << EOS >&2
Usage: install.sh [--docker] [--uninstall] [-h,--help]
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
    echo 'Installation Start ...' && \
    install && \
    echo 'Done!' && \
    path
  elif [[ "${@}" == --docker ]]; then
    ascii && \
    echo 'Installation start ...' && \
    echo 'For Docker ...' && \
    install && \
    docker && \
    echo 'Done!' && \
    path
  elif [[ "${@}" == --uninstall ]]; then
    ascii && \
    echo 'Uninstallation start ...' && \
    uninstall && \
    echo 'Done!'
  elif [[ "${@}" == -h ]]|| \
       [[ "${@}" == --help ]]; then
    usage
  else
    error
  fi
}

separete_opt "${@}"