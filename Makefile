﻿.PHONY = all clean run
CURDIR_TMP := $(CURDIR)

all:
	@echo Make WiiFlow Booter
	@$(MAKE) --no-print-directory -C $(CURDIR_TMP)/resources/wiiflow_game_booter \
		-f $(CURDIR_TMP)/resources/wiiflow_game_booter/Makefile
	@mv -f $(CURDIR_TMP)/resources/wiiflow_game_booter/boot.dol \
		$(CURDIR_TMP)/data/wiiflow_game_booter.dol
	@echo Make WiiFlow Main
	@$(MAKE) --no-print-directory -C $(CURDIR_TMP) -f $(CURDIR_TMP)/Makefile.main
clean:
	@echo Cleanup WiiFlow Booter
	@$(MAKE) --no-print-directory -C $(CURDIR_TMP)/resources/wiiflow_game_booter \
			-f $(CURDIR_TMP)/resources/wiiflow_game_booter/Makefile clean
	@echo Cleanup WiiFlow Main
	@$(MAKE) --no-print-directory -C $(CURDIR_TMP) -f $(CURDIR_TMP)/Makefile.main clean
run:
	@$(MAKE) --no-print-directory -C $(CURDIR_TMP) -f $(CURDIR_TMP)/Makefile.main run
