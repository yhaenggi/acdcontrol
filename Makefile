RELEASE_FILES=acdcontrol.cpp acdcontrol.init acdcontrol.sysconfig COPYING COPYRIGHT Makefile VERSION
VERSION=$(shell cat VERSION)
VERNAME=acdcontrol-$(VERSION)
DIRNAME=/tmp/$(VERNAME)

acdcontrol: acdcontrol.cpp

release:
	mkdir -p $(DIRNAME)
	rm -rf $(DIRNAME)/*
	cp $(RELEASE_FILES) $(DIRNAME)
	tar cvfz $(VERNAME).tar.gz -C /tmp $(VERNAME) 

upload:
	curl -T $(VERNAME).tar.gz ftp://anonymous@upload.sourceforge.net/incoming/
