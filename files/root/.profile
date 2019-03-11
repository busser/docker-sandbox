# Aliases
alias ll='ls -lh'

# Text formatting
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
bold=$(tput bold)
underline=$(tput smul)
default=$(tput sgr0)

# Prompt
PS1="(ID: \h) ${yellow}\w${default} "

# Welcome message
cat <<-EOM

Welcome to the ${bold}${blue}Docker Sandbox${default}!
This service is hosted for you for the duration of this training session.

${underline}Sandbox information${default}:
    Sandbox ID: $(hostname)
    Sandbox IP: $(hostname -i)
    Docker version: ${DOCKER_VERSION}
    Docker channel: ${DOCKER_CHANNEL}

${underline}Things you should know${default}:
  - ${bold}${red}${underline}None of your work will be saved${default}. If you wish to keep it, you will need to
    export it yourself somehow.
  - Refreshing this page will provide you with a new sandbox; the previous one
    will no longer be accessible.
  - If you need help with something, provide us with the ID above; it is
    unique to this sandbox.
  
${underline}Port mapping${default}:
    Available ports: ${bold}${yellow}${PUBLISHED_PORTS}${default}

${bold}${green}Have fun!${default}

EOM
