BOARDS = $(wildcard *.brd)

GERBERS = GTL GBL GTO GBO GTS GBS GML TXT

all: $(foreach sfx,$(GERBERS) png zip,$(BOARDS:.brd=.$(sfx)))

clean:
	$(RM) $(foreach sfx,$(GERBERS) png zip gpi dri,$(BOARDS:.brd=.$(sfx)))
distclean: clean
	$(RM) $(wildcard *.?#?)

.PHONY: all clean distclean



%.GTL: %.brd # top layer
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension Top Pads Vias >/dev/null 2>&1
%.GBL: %.brd # bottom layer
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension Bottom Pads Vias >/dev/null 2>&1
%.GTO: %.brd # top silkscreen
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension tPlace tNames >/dev/null 2>&1
%.GBO: %.brd # bottom silkscreen
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension bPlace bNames >/dev/null 2>&1
%.GTS: %.brd # top solder mask
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension tStop >/dev/null 2>&1
%.GBS: %.brd # bottom solder mask
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension bStop >/dev/null 2>&1
%.GTP: %.brd # top solder paste
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension tCream >/dev/null 2>&1
%.GBP: %.brd # bottom solder paste
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension bCream >/dev/null 2>&1
%.GML: %.brd # Slot drill/holes/outline
	eagle -X -O+ -dGERBER_RS274X -o $@ $< Dimension Milling >/dev/null 2>&1
%.TXT: %.brd # Drills and Holes
	eagle -X -O+ -dEXCELLON      -o $@ $< Dimension Drills Holes >/dev/null 2>&1



%.zip: $(foreach sfx,$(GERBERS),%.$(sfx))
	zip $@ $^



%.png: $(foreach sfx,GTL GBL GML GTS GTO TXT,%.$(sfx))
	gerbv --export=png --output=$@ --dpi=400 --background=#000000 \
		--f=#000000 $*.TXT \
		--f=#C4C4C4 $*.GTO \
		--f=#FFDE4E $*.GTS \
		--f=#630B79 $*.GTL \
		--f=#2D114A $*.GBL \
		--f=#FFFFFF $*.GML \
