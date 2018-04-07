OS2 := $(strip $(shell uname))
ifeq ($(OS2), Darwin)
  LIBS = "-framework OpenGL ${CONS_DIR}/debug/grid.o ${CONS_DIR}/debug/clipper.o -lpolyclipping ${CONS_DIR}/debug/libfive.o  -lfive -lc++"
else
  OS := $(strip $(shell uname -o))
  ifeq ($(OS), GNU/Linux)
    LIBS = "-lGL -lGLU ${CONS_DIR}/debug/grid.o ${CONS_DIR}/debug/clipper.o -lpolyclipping ${CONS_DIR}/debug/libfive.o -lfive -lstdc++"
  endif
endif

all: clean joinery

joinery: 
	stanza joinery.stanza primitives.stanza utilities.stanza connection.stanza -o joinery -ccflags ${LIBS}

clean:
	rm -f joinery
	rm -f test*.stl
