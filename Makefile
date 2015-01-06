
sources = $(wildcard *.gv.m4)
images_svg = $(patsubst %.gv.m4,%.svg,$(sources))
temp_files = $(patsubst %.gv.m4,%.gv,$(sources))

.SECONDARY:

svg: $(images_svg)

%.svg: %.gv
	rm -f $@
	dot -Tsvg -o$@ $<
	chmod uog-w $@

%.gv: %.gv.m4 common.m4
	rm -f $@
	m4 -P common.m4 $< > $@
	chmod uog-w $@

clean:
	rm -f $(temp_files) $(images_svg) $(wildcard *~)



