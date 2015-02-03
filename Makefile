
PACKAGE_NAME = niem-change-processes

ifeq ($(TRAVIS_TAG),)
TRAVIS_TAG = latest
endif
TRAVIS_TAG = latest

RESULTS_NAME = $(PACKAGE_NAME)-$(TRAVIS_TAG)
ZIP_FILE = $(RESULTS_NAME).zip
ZIP_DIR = tmp/$(RESULTS_NAME)

sources = $(wildcard *.gv.m4)
images_svg = $(patsubst %.gv.m4,%.svg,$(sources))
images_pdf = $(patsubst %.gv.m4,%.pdf,$(sources))
pages_html = $(patsubst %.gv.m4,$(ZIP_DIR)/%.html,$(sources))

.SECONDARY:

default: zip

zip: $(ZIP_FILE)

$(ZIP_FILE): $(pages_html)
	rm -f $@
	cd $(dir $(ZIP_DIR)); zip -9r ../$(ZIP_FILE) $(notdir $(ZIP_DIR))
	chmod uog-w $@

svg: $(images_svg)

all: svg pdf

pdf: $(images_pdf)

html: $(pages_html)

tmp/$(RESULTS_NAME)/%.html: tmp/%.map tmp/%.svg.base64 generic.html.m4
	mkdir -p $(dir $@)
	m4 -P -DM_NAME=$* generic.html.m4 > $@

tmp/%.map tmp/%.svg: tmp/%.gv
	mkdir -p $(dir $@)
	dot -Tsvg -otmp/$*.svg -Tcmapx -otmp/$*.map $<

tmp/%.svg.base64: tmp/%.svg
	mkdir -p $(dir $@)
	base64 $< > $@


tmp/%.svg: tmp/%.gv
	mkdir -p $(dir $@)
	rm -f $@
	dot -Tsvg -o$@ $<
	chmod uog-w $@

tmp/%.gv: %.gv.m4 common.m4
	mkdir -p $(dir $@)
	rm -f $@
	m4 -P common.m4 $< > $@
	chmod uog-w $@

tmp/%.ps2: tmp/%.gv
	mkdir -p $(dir $@)
	rm -f $@
	dot -Tps2 $< > $@
	chmod uog-w $@

tmp/%.pdf: tmp/%.ps2
	mkdir -p $(dir $@)
	rm -f $@
	ps2pdf $< $@
	chmod uog-w $@

clean:
	rm -rf tmp
	rm -f $(wildcard *~) $(ZIP_FILE)


