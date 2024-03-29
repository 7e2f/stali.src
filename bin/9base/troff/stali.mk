# mk - mk unix port from plan9
# Depends on ../lib9
ROOT=../../..
include $(ROOT)/config.mk

CFLAGS += -DUNICODE -DTMACDIR=\"/tmac/tmac.\" -DTDEVNAME=\"utf\" -DFONTDIR=\"/font\" -DNTERMDIR=\"/term/tab.\" -DTEXHYPHENS=\"/hyphen.tex\" -DALTHYPHENS=\"/hyphen.tex\" -DDWBHOME=\"$(TROFFDIR)/\" -I../lib9
BIN = troff
LIBS = ../lib9/lib9.a
OBJS = n1.o n2.o n3.o n4.o n5.o t6.o n6.o n7.o n8.o n9.o t10.o\
       n10.o t11.o ni.o hytab.o suftab.o dwbinit.o mbwc.o
TROFFDIR = $(PREFIX)/lib/troff

include $(ROOT)/mk/bin.mk

postinst:
	@mkdir -p $(DESTDIR)$(TROFFDIR)
	@cp -r tmac $(DESTDIR)$(TROFFDIR)
	@cp -r font $(DESTDIR)$(TROFFDIR)
	@cp -r term $(DESTDIR)$(TROFFDIR)
	@cp -r hyphen.tex $(DESTDIR)$(TROFFDIR)

postuninst:
	@rm -rf $(DESTDIR)$(TROFFDIR)

