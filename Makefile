# compiler
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17

# automatically find all .cpp files in the directory
SRCS := $(wildcard *.cpp)
OBJS := $(SRCS:.cpp=.o)
TARGET = hello_world

# default rule: build the executable
all: $(TARGET)

# linking the object files
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# compiling each .cpp file in to an object file
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

# clean up generated files
clean:
	@echo "Cleaning up..."
	-del /Q $(OBJS) $(TARGET) *.exe 2>nul || rm -f $(OBJS) $(TARGET)@rm -f $(OBJS) $(TARGET) *.exe

# ensure compatibility for Windows (cmd does not have `rm` command)
.PHONY: all clean