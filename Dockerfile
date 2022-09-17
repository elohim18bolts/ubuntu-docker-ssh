FROM ubuntu:18.04
RUN apt update && apt install -y openssh-server

#Change the configuration to use login with password
RUN sed -i 's/#\(PermitRootLogin\) \(prohibit-password\)/\1 yes/' /etc/ssh/sshd_config
#Add password to root user
RUN echo 'root:password' | chpasswd

#Create a sshd folder in /run path. This allow sshd to start from terminal.

RUN mkdir /run/sshd



EXPOSE 1022
CMD ["/usr/sbin/sshd","-D","-p","1022"]
