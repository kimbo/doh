TARGET = doh
OBJS = doh.o sound/doh-sound.o
SOUND_LIBS = -lSDL2 -lpthread
LDLIBS = $(SOUND_LIBS) `curl-config --libs`
CFLAGS := $(CFLAGS) -W -Wall -pedantic -g `curl-config --cflags`
MANUAL = doh.1

BINDIR ?= /usr/bin
MANDIR ?= /usr/share/man

$(TARGET): $(OBJS)

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m 0755 $(TARGET) $(DESTDIR)$(BINDIR)
	install -m 0744 $(MANUAL) $(MANDIR)/man1/

clean:
	rm -f $(OBJS) $(TARGET)
