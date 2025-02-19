#That is special make feature, .phony allows us to create a fictitious targets
#Every target should provide a material result, but not fictitious
#For example, it helps to resolve next problem: what must return clear target?
.PHONY: all build builddir clean
#Name of our project
TARGET=server

#Directory where all sources will be compiled into object-files, last ones will be linked into executable file
BUILD_DIR=../build/$(TARGET)

#Compiler
CXX=g++

#Compilation flags
#Wall-enables all warnings
#Wextra-enable warnings not covered by Wall
#Werror-all warnings now are errors. Since that you cant compile programm with warnings)
#pedantic-additional checks including standart incompatibility
#Wconversion-bad type conversions, for example, int_64t to int_32t
#Wshadow-warns about variable shadowing, e.g. in loop
#Wuninitialized-warns about using uninitialezd variables
#Wformat-i dont think we need it, but it include formatting mistakes in printf etc.
#Wunused-warns about unused variables
#Wnull-dereference-wanrs about null pointer dereferencing
CXXFLAGS=-Wall -Wextra -Werror -pedantic -Wconversion -Wshadow -Wuninitialized -Wformat -Wunused -Wnull-dereference

#Standart, c++20 why not? it is not experimental yet and still modern
CXXSTANDART=-std=c++20

#Directory with source files
SOURCE_DIR=src

#All source files with it's fullname, i need fullname to put them in directories inside build directory
SOURCES=$(shell find $(SOURCE_DIR) -type f -wholename '*.cpp')

#Directories with header files
INCLUDE_DIR=include 
INCLUDEDIRS=$(shell find $(INCLUDE_DIR) -type d)

#All header files, same as source files
INCLUDES=$(addprefix -I, $(INCLUDEDIRS))\
		-isystem/usr/include/boost

#Compilation flags for libraries such as pqxx, qt modules etc.
LIBS=-lpthread -lpqxx -lpq
LIB_PATH=-L/usr/lib/x86_64-linux-gnu

#Object files - every .cpp file turns into .o file
OBJECTS=$(SOURCES:$(SOURCE_DIR)/%.cpp=$(BUILD_DIR)/%.o)

#All object files linked into executable
#I dont have any ideas about using something intead of static linking
#Maybe later we will using something like .so, but not know
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(BUILD_DIR)/$(TARGET) $(LIB_PATH) $(LIBS)

#Creating a directories for modules and compiling sources
$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.cpp
	mkdir -p $(dir $@)
	$(CXX) -c $< -o $@ $(CXXFLAGS) $(INCLUDES)

#For now we have only two targets - initialize build directory and build project
#in advance we'll try to make our work much complex
all: builddir $(TARGET)

#Creating build directory
builddir:
	mkdir -p $(BUILD_DIR)

#Initializing build tools
build: builddir

#Clean build directory
#It might be useful if you need rebuild whole project
clean:
	rm -rf $(BUILD_DIR)



