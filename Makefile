# Makefile
# RARBG Catalog
# Viktor Panteleev
# www.github.com/colonelx

PROGRAM = rarbg_catalog
PROGRAM_DEBUG = rarbg_catalog-debug
SRC = src/application.vala 

PKGS = --pkg gtk+-3.0
VALAC = valac
VALACOPTS = -X -O2
VALACOPTS_DEBUG = -g #--save-temps

all:
	@$(VALAC) $(VALACOPTS_DEBUG) $(SRC) -o $(PROGRAM_DEBUG) $(PKGS)

release:
	@$(VALAC) $(VALACOPTS) $(SRC) -o $(PROGRAM) $(PKGS)

clean:
	@rm -v -fr $(PROGRAM) $(PROGRAM_DEBUG)
