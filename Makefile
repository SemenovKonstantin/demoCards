.PHONY: all client server clean-server clean-client clean

all: client server

client:
	cd client && make -f Makefile

server:
	cd server && make -f Makefile

clean: clean-server clean-client
	rm -rf build

clean-server:
	cd server && make -f Makefile clean

clean-client:
	cd client && make -f Makefile clean




