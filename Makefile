# dwm-win32 - dynamic window manager for win32
# See LICENSE file for copyright and license details.

CC      = cl
CFLAGS  = /Wall user32.lib shell32.lib gdi32.lib

SRC = dwmw.c
EXE = ${SRC:.c=.exe}
OBJ = ${SRC:.c=.obj}

${EXE}: ${SRC}
	${CC} ${CFLAGS} $<

debug: CFLAGS += /Zi /DDEBUG
debug: ${EXE}

config.h:
	cp config.def.h $@

clean:
	rm -f ${EXE} ${OBJ}

.PHONY: clean debug
