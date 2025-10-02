# SPCA Assignment Docker Environment

This repository provides a Docker-based environment for running SPCA assignments and labs consistently across different operating systems.

## Prerequisites

- Docker installed from [official sources](https://www.docker.com/products/docker-desktop)
- For Apple Silicon Mac users: Docker Desktop with additional configuration

## Setup Instructions

1. **Download the Dockerfile** from the Moodle page and place it in your SPCA assignments directory (referred to as `$SPCA`).
2. **Ensure the filename** is exactly `Dockerfile` without any extension.

3. **Open a terminal** in your `$SPCA` directory.

4. **Build the Docker image**:

   ```bash
   docker build --platform linux/amd64 -t sysprog .
   ```

5. **Run and enter the environment**:
   ```bash
   docker run --platform linux/amd64 -v $SPCA:/home/user --rm -it sysprog bash
   ```

## Special Instructions for Apple Silicon Mac Users

After installing Docker Desktop, check **Settings > General** and configure as shown:

![Docker Settings for Apple Silicon](image.png)

### Using GDB Inside Docker on Apple Silicon Mac

Due to Rosetta-based amd64 simulation, use this special command to run GDB:

1. Enter the docker container with:

   ```bash
   docker run --platform linux/amd64 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $SPCA:/home/user --rm -it sysprog bash
   ```

2. Use the provided workaround script to run GDB
3. Install necessary build tools inside the container:

```bash
sudo apt update && sudo apt install build-essential flex bison
```

## Development Tools Installation

Inside the Docker container, install essential development tools:

```bash
sudo apt update
sudo apt install -y build-essential gcc gdb valgrind binutils file flex bison
```

### Installed Packages Summary

- **build-essential**: Essential compilation tools (gcc, make, etc.)
- **gcc**: GNU C compiler
- **gdb**: GNU Debugger
- **valgrind**: Memory debugging and profiling tool
- **binutils**: Binary utilities (objdump, nm, readelf, etc.)
- **file**: File type identification
- **flex**: Fast lexical analyzer
- **bison**: Parser generator

## GCC Compilation Guide

### Basic Compilation

```bash
# Simple compilation
gcc -o program program.c

# With warnings and debug symbols
gcc -Wall -Wextra -g -o program program.c

# With specific C standard
gcc -std=c99 -o program program.c

# Generate assembly output
gcc -S program.c -o program.s
```

### Common GCC Flags

- `-Wall`: Enable all warnings
- `-Wextra`: Extra warning flags
- `-g`: Include debug symbols
- `-O0`, `-O1`, `-O2`, `-O3`: Optimization levels
- `-std=c99`: C standard specification
- `-c`: Compile to object file only
- `-S`: Generate assembly code

## Makefile Usage

### Basic Makefile Structure

```makefile
CC = gcc
CFLAGS = -Wall -Wextra -g
TARGET = program
SRCS = main.c utils.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean
```

### Make Commands

```bash
make              # Build the program
make clean        # Remove build artifacts
make -j4          # Build with 4 parallel jobs
make -B           # Force rebuild everything
```

## GDB Debugging Guide

### Basic GDB Usage

```bash
# Compile with debug symbols first
gcc -g -o program program.c

# Start GDB
gdb ./program
```

### Essential GDB Commands

```gdb
run                    # Start program
break main             # Set breakpoint at main
break file.c:15        # Set breakpoint at line 15
step                   # Step into functions
next                   # Step over functions
continue               # Continue execution
print variable         # Print variable value
backtrace              # Show call stack
info registers         # Show CPU registers
disassemble function   # Show assembly code
quit                   # Exit GDB
```

### Assembly-Level Debugging

```gdb
layout asm             # Switch to assembly view
stepi                  # Step by instruction
nexti                  # Next instruction
disassemble main       # Disassemble main function
info registers         # Examine all registers
x/10i $pc             # Examine 10 instructions at program counter
```

### GDB with Apple Silicon

```bash
docker run --platform linux/amd64 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v $SPCA:/home/user --rm -it sysprog bash
```

## Valgrind Memory Debugging

### Basic Usage

```bash
# Compile with debug symbols
gcc -g -o program program.c

# Run with Valgrind
valgrind --leak-check=full ./program

# More detailed analysis
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./program
```

### Common Valgrind Options

- `--leak-check=full`: Detailed leak analysis
- `--show-leak-kinds=all`: Show all leak types
- `--track-origins=yes`: Track uninitialized values
- `--verbose`: Detailed output

## Binary Analysis Tools

### Object File Analysis

```bash
# Examine object files
file program.o
nm program.o                    # List symbols
objdump -d program.o           # Disassemble
readelf -a program.o           # Detailed ELF info
```

### Executable Analysis

```bash
file program
nm program                     # Executable symbols
objdump -d program            # Disassemble executable
readelf -h program            # ELF header
ldd program                   # Library dependencies
```

## Example Scripts

### Memory Leak Detection Script

```bash
#!/bin/bash
# test_leak.sh

# Compile with debug symbols
gcc -g -o test_program test_program.c

# Run Valgrind
valgrind --leak-check=full --show-leak-kinds=all ./test_program
```

### Complete Examination Script

```bash
#!/bin/bash
# examine_program.sh

echo "=== Building Program ==="
gcc -g -Wall -o program program.c

echo "=== File Analysis ==="
file program
echo ""

echo "=== Symbol Table ==="
nm program | head -10
echo ""

echo "=== Memory Check ==="
valgrind --leak-check=summary ./program
```

## File Types and Analysis

- **.c**: C source code (text)
- **.h**: Header files (text)
- **.o**: Object files (ELF binary) - use `objdump`, `nm`
- **.s**: Assembly files (text) - use `cat`, text editor
- **.d**: Dependency files (text) - use `cat`
- **Executable**: ELF binary - use `file`, `objdump`, `readelf`

## Connecting to the Docker Container via SSH with VSCode

To develop inside the Docker container using VSCode's Remote SSH extension:

1. **Run the Docker container with SSH port exposed**:

   ```bash
   docker run --platform linux/amd64 -p 2222:22 -v $SPCA:/home/user --rm -it sysprog bash
   ```

   For Apple Silicon Mac users with GDB support:

   ```bash
   docker run --platform linux/amd64 --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -p 2222:22 -v $SPCA:/home/user --rm -it sysprog bash
   ```

2. **Inside the container, install and start the SSH server**:

   ```bash
   sudo apt update
   sudo apt install openssh-server
   sudo service ssh start
   sudo passwd user  # Set a password for the 'user' account
   ```

3. **In VSCode, connect via Remote SSH**:
   - Install the "Remote SSH" extension if not already installed.
   - Open the command palette (Cmd+Shift+P).
   - Select "Remote-SSH: Connect to Host...".
   - Enter: `ssh user@localhost -p 2222`
   - Enter the password you set for the 'user' account.
   - Once connected, open the folder `/home/user` in VSCode.

This allows you to edit and debug your assignments directly in VSCode while running inside the Docker environment.

## Quick Reference

### Development Workflow

1. Edit code in VSCode
2. Compile: `gcc -Wall -g -o program program.c`
3. Debug: `gdb ./program`
4. Memory check: `valgrind --leak-check=full ./program`
5. Analyze: `objdump -d program`, `nm program`

### Common Issues

- **GDB not working**: Use `--cap-add=SYS_PTRACE --security-opt seccomp=unconfined` flags
- **Memory leaks**: Use Valgrind with `--leak-check=full`
- **Segmentation faults**: Debug with GDB and examine core dump
- **Missing symbols**: Compile with `-g` flag

## Notes

- This setup has been tested and works reasonably well on Apple Silicon Macs
- If you encounter any problems, don't hesitate to ask for assistance
- Consider attempting the assignments on a Windows or Linux host machine if issues persist
- Computer lab facilities are also available as an alternative

## Support

For assistance with this Docker setup, please contact the course instructors.
