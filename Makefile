prefix=/usr/local
programs=emupi rpimount

all:

install: $(programs)
	@for bin in $(programs); do\
	  echo "INSTALL $$bin"; \
	  if test `id -u` = 0; then \
	    install -m 755 -o root -g root $$bin $(prefix)/bin; \
	  else \
	    install -m 755 $$bin $(HOME)/bin; \
	  fi; \
	done

uninstall:
	@for bin in $(programs); do\
	  echo "UNINSTALL $$bin"; \
	  if test `id -u` = 0; then \
	    rm -f $(prefix)/bin/$$bin; \
	  else \
	    rm -f $(HOME)/bin/$$bin; \
	  fi; \
	done
