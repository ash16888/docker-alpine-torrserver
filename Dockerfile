### Use small Alpine image
FROM alpine:latest  

#Make dir for app 
RUN  mkdir /ts/  

# Set the working directory to /ts
WORKDIR /ts

#Add packets and download TorrServer
 
 RUN apk add --no-cache wget &&  apk add libc6-compat && wget -O TorrServer -P /ts/ "https://github.com//YouROK/TorrServer/releases/latest/download/TorrServer-linux-amd64" &&   chmod +x /ts/TorrServer

# Tell the port number the container should expose
EXPOSE 8090

#Start TorreServer  

ENTRYPOINT  ["/ts/TorrServer"]
