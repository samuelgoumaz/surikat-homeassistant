# surikat-homeassistant
Homeassistant extension

Build : 
docker build -t surikat-homeassistant .

Launch :
docker run -d -p 8000:8000 --name surikat-instance surikat-homeassistant

Build local : 
docker build --build-arg BUILD_FROM=python:3.11-slim -t surikat-homeassistant .