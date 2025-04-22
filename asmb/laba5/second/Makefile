# Compiler and flags
CXX       := clang++
CXX_FLAGS := -Wall -Wextra -std=c++17 -ggdb -fasm-blocks
NASM      := nasm
NASM_FLAGS := -f elf64

# Directories and files
BIN       := bin
LIBRARIES := 
EXECUTABLE := main

SOURCES := $(wildcard *.cpp)
ASM_SOURCES := $(wildcard *.asm)
OBJECTS := $(patsubst %.cpp, $(BIN)/%.o, $(SOURCES)) \
           $(patsubst %.asm, $(BIN)/%.o, $(ASM_SOURCES))

# Targets
all: $(BIN)/$(EXECUTABLE)

run: clean all
	@echo "🚀 Executing..."
	./$(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE): $(OBJECTS) | $(BIN)
	@echo "🚧 Linking..."
	$(CXX) $(CXX_FLAGS) $^ -o $@ $(LIBRARIES)

$(BIN)/%.o: %.cpp | $(BIN)
	@echo "🔨 Compiling $<..."
	$(CXX) $(CXX_FLAGS) -c $< -o $@

$(BIN)/%.o: %.asm | $(BIN)
	@echo "🔧 Assembling $<..."
	$(NASM) $(NASM_FLAGS) $< -o $@

$(BIN):
	mkdir -p $(BIN)

clean:
	@echo "🧹 Clearing..."
	-rm -rf $(BIN)/*

.PHONY: all run clean
