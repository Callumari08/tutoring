FROM archlinux-latest

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel
RUN pacman-key --init # archlinux docker hub page says you gotta do this yourself for security reasons: https://hub.docker.com/_/archlinux/
RUN pacman -S --noconfirm sudo neovim nano tmux jre-openjdk 

# Make User (and make them a SUSUSUDOER)
RUN useradd -ms /bin/bash -d /home/james -G wheel james
COPY config/sudoers /etc/
USER james
WORKDIR /home/james

EXPOSE 25565/tcp
EXPOSE 25565/udp

CMD ["/bin/bash"]
