ARG cli_image
# Use a stock Docksal image as the base
FROM $cli_image

# Install addtional apt packages
RUN echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' > /etc/apt/sources.list.d/fish.list
RUN wget -nv https://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key -O Release.key
RUN apt-key add - < Release.key
RUN apt-get update && apt-get -y --no-install-recommends install \
    fish \
    lynx \
    fonts-powerline \
    git-flow \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*   # Cleanup

RUN usermod -s /usr/bin/fish docker

# All further commands will be performed as the docker user.
USER docker

# Install fisherman so we can easily access fish shell themes and plugins.
# https://fisherman.github.io/ https://github.com/fisherman/fisherman
# https://github.com/oh-my-fish/oh-my-fish
RUN mkdir -p /home/docker/.config/fish/functions/ \
    && curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher 

# Copy configuration files and scripts
COPY __docksalfishenvironmentsetup.fish /home/docker/.config/fish/functions/
COPY config.fish /home/docker/.config/fish/

# IMPORTANT! Switching back to the root user as the last instruction.
USER root

# Starter script
#ENTRYPOINT ["/opt/startup.sh"]
