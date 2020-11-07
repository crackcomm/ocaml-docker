FROM ubuntu:latest
RUN apt-get update && apt-get install -y opam && rm -rf /var/lib/apt/lists/
ARG OCAML_VER
RUN opam init -a --disable-sandboxing && \
  opam switch create $OCAML_VER && \
  opam install -y dune
