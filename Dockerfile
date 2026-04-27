FROM debian:latest

LABEL version="1.0"
LABEL description="A simple docker container to run BumpMesh locally."

ENV port=8000

EXPOSE $port/tcp

# Perform updates & install dependancies.
RUN apt update
RUN apt install git python3 python3-requests -y

# Copy in BumpMesh
COPY . /app

# Run BumpMesh
CMD python3 -m http.server $port -d /app
