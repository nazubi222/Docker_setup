# Docker_setup

docker volume create my-volume
docker build -t anhtt-image .
docker run --name anhtt -v my-volume:/app -it anhtt-image
