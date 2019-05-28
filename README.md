# docker-sonar-golang
#Docker para construir y ejecutar sonar runner

#Construcción:

sudo docker build --rm --force-rm --compress -f Dockerfile -t diazr/sonnar-golang:1.0 --no-cache --pull .
sudo docker login --username=diazr
sudo docker push diazr/sonnar-golang:1.0
