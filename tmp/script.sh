#!/bin/bash

echo "=== Setting up examination ==="

# 1. First, make sure we're in the right directory
echo "Current directory: $(pwd)"
echo "Files here:"
ls -la

# 2. Build everything
echo ""
echo "=== Building with Make ==="
make clean
make all
make assembly

# 3. Check what was created
echo ""
echo "=== Generated Files ==="
ls -la *.o *.d *.s pointer 2>/dev/null || echo "No generated files found yet"

# 4. Examine each file type
echo ""
echo "=== Examining Object File (.o) ==="
if [ -f pointer.o ]; then
    echo "File type:"
    file pointer.o
    echo ""
    echo "Symbols:"
    nm pointer.o
    echo ""
    echo "First lines of disassembly:"
    objdump -d pointer.o | head -30
else
    echo "pointer.o not found!"
fi

echo ""
echo "=== Examining Dependency File (.d) ==="
if [ -f pointer.d ]; then
    cat pointer.d
else
    echo "pointer.d not found - generating..."
    gcc -MM pointer.c > pointer.d
    cat pointer.d
fi

echo ""
echo "=== Examining Executable ==="
if [ -f pointer ]; then
    echo "File type:"
    file pointer
    echo ""
    echo "Relevant symbols:"
    nm pointer | grep -E "main|test_|T " | head -10
    echo ""
    echo "Library dependencies:"
    ldd pointer
else
    echo "Executable not found!"
fi

echo ""
echo "=== Examining Assembly File (.s) ==="
if [ -f pointer.s ]; then
    echo "First 30 lines of assembly:"
    head -30 pointer.s
else
    echo "pointer.s not found - generating..."
    gcc -S pointer.c -o pointer.s
    head -30 pointer.s
fi

echo ""
echo "=== Running the Program ==="
if [ -f pointer ]; then
    ./pointer
else
    echo "Cannot run - executable not built!"
fi