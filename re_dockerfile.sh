docker rm -f $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker build -t pene .
docker run -it -p 80:80 -p 443:443 pene