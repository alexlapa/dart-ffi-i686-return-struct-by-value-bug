run.clang:
	clang -shared -o libstruct.so structs.c \
	&& dart structs.dart

run.docker:
	docker build -t dart-ffi . \
	&& docker run dart-ffi

.PHONY: run.clang run.docker