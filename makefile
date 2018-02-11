SRCS = test.cpp
OBJS = test.o

CC = 
LINKER = 
EXE = 

LINUX_CC = g++
LINUX_LINKER = g++
LINUX_EXE = fee

WIN_CC = x86_64-w64-mingw32-g++
WIN_LINKER = x86_64-w64-mingw32-g++
WIN_EXE = fee.exe

COMPILER_FLAGS = -Wall -c
LINKER_FLAGS = -lSDL2 -Wall

.PHONY : all linux windows

linux: CC=$(LINUX_CC)
linux: LINKER=$(LINUX_LINKER)
linux: EXE=$(LINUX_EX)
linux: $(LINUX_EXE)

windows: CC=$(WIN_CC)
windows: LINKER=$(WIN_LINKER)
windows: EXE=$(WIN_EXE)
windows: $(WIN_EXE)

all: linux

$(LINUX_EXE): $(OBJS)
	$(LINKER) $^ $(LINKER_FLAGS) -o $@

$(WIN_EXE): $(OBJS)
	$(LINKER) $^ $(LINKER_FLAGS) -o $@

test.o: test.cpp
	$(CC) $^ $(COMPILER_FLAGS) -o $@