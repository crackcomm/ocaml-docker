
VER?=4.11.1
TARGET?=1
DISTRO?=ubuntu

preimage:
	docker tag busybox registry.local/ocaml:$(VER)
	docker push registry.local/ocaml:$(VER)

pipeline:
	fly -t $(TARGET) set-pipeline -p ocaml --var version=$(VER) --var distro=$(DISTRO) -c pipeline.yml

all: preimage pipeline
