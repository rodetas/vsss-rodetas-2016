COMPILER = g++ -std=c++11 -Wall -g -Ofast
EXEC_PROG = Rodetas
BINARIES = $(EXEC_PROG)

SOURCES := $(shell find -name '*.cpp')

OBJECTS = $(SOURCES:.cpp=.o)

OPENCVLIB = `pkg-config opencv --cflags --libs`
SFMLLIB = -lsfml-graphics -lsfml-window -lsfml-system
TGUILIB = -ltgui
OPENGLLIB = -lGL
LIBS = $(SFMLLIB) $(TGUILIB) $(OPENCVLIB) $(OPENGLLIB) -lpthread

all: $(EXEC_PROG)
	@echo Rodetas Build Completed

%.o: %.cpp
	$(COMPILER) -c $(LIBS) -o $@ $< -w

$(EXEC_PROG): $(OBJECTS)
	$(COMPILER) -o $(EXEC_PROG) $(OBJECTS) $(LIBS)

# prevents make from getting confused
.PHONY : run
run:
	./$(EXEC_PROG)

.PHONY : clean 
clean:
	rm -rf $(EXEC_PROG) $(OBJECTS)

clean-instance:
	find files/instances/ ! -name 'fileCalibration.txt' -type f -exec rm -f {} +;