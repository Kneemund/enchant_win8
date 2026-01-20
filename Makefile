# Compiler and flags
CC := gcc
CFLAGS := -shared -fPIC -Wall -Wextra
PKG_CONFIG := pkg-config

# Packages
PACKAGES := glib-2.0 enchant-2

# Source and output
SRC := src/win8_provider.c
TARGET := libenchant_win8.dll

# Get flags from pkg-config
PKG_CFLAGS := $(shell $(PKG_CONFIG) --cflags $(PACKAGES))
PKG_LIBS := $(shell $(PKG_CONFIG) --libs $(PACKAGES))

. PHONY: all clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(PKG_CFLAGS) -o $@ $< $(PKG_LIBS)

clean:
	rm -f $(TARGET)