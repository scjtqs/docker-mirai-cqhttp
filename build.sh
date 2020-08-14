
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker buildx create --use --name mybuilder
docker buildx build --tag scjtqs/mirai-cqhttp:all-in-one --platform linux/amd64,linux/arm64,linux/arm/v7,linux/386,linux/ppc64le --push .
docker buildx rm mybuilder
