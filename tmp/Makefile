# # Makefile for pointer program

# # Variables
# CC = gcc
# CFLAGS = -Wall -Wextra -g
# TARGET = pointer
# SRC = pointer.c
# OBJ = pointer.o

# # Default target
# all: $(TARGET)

# # Build the final executable
# $(TARGET): $(OBJ)
# 	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# # Compile source files to object files
# $(OBJ): $(SRC)
# 	$(CC) $(CFLAGS) -c $(SRC)

# # Clean up build files
# clean:
# 	rm -f $(OBJ) $(TARGET)

# # Phony targets (not actual files)
# .PHONY: all clean


# Project Makefile

# Compiler settings
CC = gcc
CFLAGS = -Wall -Wextra -g -std=c99 -O2
LDFLAGS = 
TARGET = pointer

# Source files
SRCS = pointer.c
OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Create executable
$(TARGET): $(OBJS)
	@echo "Linking $(TARGET)..."
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)
	@echo "Build complete: $(TARGET)"

# Compile source files
%.o: %.c
	@echo "Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	@echo "Cleaning..."
	rm -f $(OBJS) $(TARGET) *.d

# Run the program
run: $(TARGET)
	@echo "Running $(TARGET)..."
	./$(TARGET)

# Debug build
debug: CFLAGS += -DDEBUG -O0
debug: $(TARGET)

# Show help
help:
	@echo "Available targets:"
	@echo "  all     - Build the program (default)"
	@echo "  clean   - Remove build artifacts"
	@echo "  run     - Build and run the program"
	@echo "  debug   - Build with debug flags"
	@echo "  help    - Show this help"

# Include dependency files
-include $(SRCS:.c=.d)

# Generate dependency files
%.d: %.c
	@$(CC) -MM $< > $@

.PHONY: all clean run debug help