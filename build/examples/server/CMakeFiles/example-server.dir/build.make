# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.6

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\msys64\mingw64\bin\cmake.exe

# The command to remove a file.
RM = C:\msys64\mingw64\bin\cmake.exe -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\jakub\Documents\GitHub\librpc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\jakub\Documents\GitHub\librpc\build

# Include any dependencies generated for this target.
include examples/server/CMakeFiles/example-server.dir/depend.make

# Include the progress variables for this target.
include examples/server/CMakeFiles/example-server.dir/progress.make

# Include the compile flags for this target's objects.
include examples/server/CMakeFiles/example-server.dir/flags.make

examples/server/CMakeFiles/example-server.dir/server.c.obj: examples/server/CMakeFiles/example-server.dir/flags.make
examples/server/CMakeFiles/example-server.dir/server.c.obj: examples/server/CMakeFiles/example-server.dir/includes_C.rsp
examples/server/CMakeFiles/example-server.dir/server.c.obj: ../examples/server/server.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\jakub\Documents\GitHub\librpc\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object examples/server/CMakeFiles/example-server.dir/server.c.obj"
	cd /d C:\Users\jakub\Documents\GitHub\librpc\build\examples\server && clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\example-server.dir\server.c.obj   -c C:\Users\jakub\Documents\GitHub\librpc\examples\server\server.c

examples/server/CMakeFiles/example-server.dir/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/example-server.dir/server.c.i"
	cd /d C:\Users\jakub\Documents\GitHub\librpc\build\examples\server && clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\jakub\Documents\GitHub\librpc\examples\server\server.c > CMakeFiles\example-server.dir\server.c.i

examples/server/CMakeFiles/example-server.dir/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/example-server.dir/server.c.s"
	cd /d C:\Users\jakub\Documents\GitHub\librpc\build\examples\server && clang  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\jakub\Documents\GitHub\librpc\examples\server\server.c -o CMakeFiles\example-server.dir\server.c.s

examples/server/CMakeFiles/example-server.dir/server.c.obj.requires:

.PHONY : examples/server/CMakeFiles/example-server.dir/server.c.obj.requires

examples/server/CMakeFiles/example-server.dir/server.c.obj.provides: examples/server/CMakeFiles/example-server.dir/server.c.obj.requires
	$(MAKE) -f examples\server\CMakeFiles\example-server.dir\build.make examples/server/CMakeFiles/example-server.dir/server.c.obj.provides.build
.PHONY : examples/server/CMakeFiles/example-server.dir/server.c.obj.provides

examples/server/CMakeFiles/example-server.dir/server.c.obj.provides.build: examples/server/CMakeFiles/example-server.dir/server.c.obj


# Object files for target example-server
example__server_OBJECTS = \
"CMakeFiles/example-server.dir/server.c.obj"

# External object files for target example-server
example__server_EXTERNAL_OBJECTS =

examples/server/example-server.exe: examples/server/CMakeFiles/example-server.dir/server.c.obj
examples/server/example-server.exe: examples/server/CMakeFiles/example-server.dir/build.make
examples/server/example-server.exe: liblibrpc.dll.a
examples/server/example-server.exe: examples/server/CMakeFiles/example-server.dir/linklibs.rsp
examples/server/example-server.exe: examples/server/CMakeFiles/example-server.dir/objects1.rsp
examples/server/example-server.exe: examples/server/CMakeFiles/example-server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\jakub\Documents\GitHub\librpc\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable example-server.exe"
	cd /d C:\Users\jakub\Documents\GitHub\librpc\build\examples\server && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\example-server.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/server/CMakeFiles/example-server.dir/build: examples/server/example-server.exe

.PHONY : examples/server/CMakeFiles/example-server.dir/build

examples/server/CMakeFiles/example-server.dir/requires: examples/server/CMakeFiles/example-server.dir/server.c.obj.requires

.PHONY : examples/server/CMakeFiles/example-server.dir/requires

examples/server/CMakeFiles/example-server.dir/clean:
	cd /d C:\Users\jakub\Documents\GitHub\librpc\build\examples\server && $(CMAKE_COMMAND) -P CMakeFiles\example-server.dir\cmake_clean.cmake
.PHONY : examples/server/CMakeFiles/example-server.dir/clean

examples/server/CMakeFiles/example-server.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\jakub\Documents\GitHub\librpc C:\Users\jakub\Documents\GitHub\librpc\examples\server C:\Users\jakub\Documents\GitHub\librpc\build C:\Users\jakub\Documents\GitHub\librpc\build\examples\server C:\Users\jakub\Documents\GitHub\librpc\build\examples\server\CMakeFiles\example-server.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : examples/server/CMakeFiles/example-server.dir/depend

