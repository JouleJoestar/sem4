CXX       := g++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb

BIN       := bin
LIBRARIES := 
EXECUTABLE := main

SOURCES := $(wildcard *.c)
HEADERS  := $(wildcard *.h)

all: $(BIN)/$(EXECUTABLE)

run: clean all
	@echo "🚀 Executing..."
	./$(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(SOURCES) $(HEADERS) | $(BIN)
	@echo "🚧 Building..."
	$(CXX) $(CXX_FLAGS) $^ -o $@ $(LIBRARIES)

$(BIN):
	mkdir -p $(BIN)

clean:
	@echo "🧹 Clearing..."
	-rm -rf $(BIN)/*
