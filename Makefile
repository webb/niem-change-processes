
sources = $(wildcard *.gv.m4)
images_svg = $(patsubst %.gv.m4,%.svg,$(sources))
images_pdf = $(patsubst %.gv.m4,%.pdf,$(sources))

.SECONDARY:

svg: $(images_svg)

all: svg pdf

pdf: $(images_pdf)

%.svg: %.gv
	rm -f $@
	dot -Tsvg -o$@ $<
	chmod uog-w $@

%.gv: %.gv.m4 common.m4
	rm -f $@
	m4 -P common.m4 $< > $@
	chmod uog-w $@

%.ps2: %.gv
	rm -f $@
	dot -Tps2 $< > $@
	chmod uog-w $@

%.pdf: %.ps2
	rm -f $@
	ps2pdf $< $@
	chmod uog-w $@

clean:
	rm -f $(temp_files) $(images_svg) $(wildcard *~) $(images_pdf) \
		$(patsubst %.gv.m4,%.gv,$(sources)) \
		$(patsubst %.gv.m4,%.ps2,$(sources))




