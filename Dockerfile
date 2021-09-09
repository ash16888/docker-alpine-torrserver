### Use small Alpine image
FROM alpine:latest  

#Make dir for app 
RUN  mkdir /ts/  

# Set the working directory to /ts
WORKDIR /ts

#Add packets and download TorrServer
 
RUN apk add --no-cache wget &&  apk add libc6-compat && wget -O TorrServer -P /ts/ "https://github.com/YouROK/TorrServer/releases/download/MatriX.105/TorrServer-linux-amd64" &&   chmod +x /ts/TorrServer

# Copy config  file to image
COPY accs.db  /ts/

# Tell the port number the container should expose
EXPOSE 8090

#Start TorreServer with login pwd from accs.db

ENTRYPOINT  ["/ts/TorrServer", "-a"]
