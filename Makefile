# dwm-win32 - dynamic window manager for win32
# See LICENSE file for copyright and license details.

CC      = cl
LD      = link

CFLAGS  = /Wall user32.lib shell32.lib gdi32.lib
LDFLAGS = /dll user32.lib

EXE = dwmw.exe
DLL = hook.dll

${EXE}: ${EXE:.exe=.c} ${DLL}
	${CC} ${CFLAGS} $<

${DLL}: ${DLL:.dll=.c}
	${CC} /c $<
	${LD} ${LDFLAGS} ${DLL:.dll=.obj}

debug: CFLAGS += /Zi /DDEBUG
debug: ${EXE}

config.h:
	cp config.def.h $@

clean:
	rm -f *.exe *.obj *.dll *.ilk *.exp *.pdb *.lib

.PHONY: clean debug
