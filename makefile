SRCS = test.cpp
OBJS = test.o
WIN_OBJS = test.win.o

CC = g++
LINKER = g++
EXE = fee
COMPILER_FLAGS = -Wall -c
LINKER_FLAGS = -Wall -lSDL2

WIN_CC = x86_64-w64-mingw32-g++
WIN_LINKER = x86_64-w64-mingw32-g++
WIN_EXE = fee.exe
WIN_COMPILER_FLAGS = -Wall -c -I /usr/local/cross-tools/x86_64-w64-mingw32/include/ 
WIN_LINKER_FLAGS = -Wall -L /usr/local/cross-tools/x86_64-w64-mingw32/lib/ -lmingw32 -lSDL2main -lSDL2 -static-libstdc++ -static-libgcc



.PHONY : all linux windows clean

all: linux windows

linux: $(EXE)

windows: $(WIN_EXE)

clean: 
	rm -f $(EXE) $(WIN_EXE) $(OBJS) $(WIN_OBJS) temp.exe

$(EXE): $(OBJS)
	$(LINKER) $^ $(LINKER_FLAGS) -o $@

$(WIN_EXE): temp.exe
	osslsigncode sign -certs ~/.signing/jd.crt -key ~/.signing/jd.key -n "Fire Emblem Custom Engine" -i https://github.com/Bai-Ren -in $^ -out $@

temp.exe: $(WIN_OBJS)
	$(WIN_LINKER) $^ $(WIN_LINKER_FLAGS) -o $@

test.o: test.cpp
	$(CC) $^ $(COMPILER_FLAGS) -o $@

test.win.o: test.cpp
	$(WIN_CC) $^ $(WIN_COMPILER_FLAGS) -o $@ 