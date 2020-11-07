
VER?=4.11.1
TARGET?=1
DISTRO?=ubuntu

preimage:
	docker tag busybox registry:5000/ocaml:$(VER)
	docker push registry:5000/ocaml:$(VER)

pipeline:
	fly -t $(TARGET) set-pipeline -p ocaml --var version=$(VER) --var distro=$(DISTRO) -c pipeline.yml
	fly -t $(TARGET) trigger-job -j ocaml/build-ext-image

all: preimage pipeline
