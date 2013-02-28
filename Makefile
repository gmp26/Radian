# See the README for installation instructions.

JS_UGLIFY = uglifyjs

all: radian.js radian.min.js examples

.INTERMEDIATE radian.js: \
	src/start.js \
	src/core.js \
	src/expressions.js \
	src/data.js \
	src/plots.js \
	src/lib.js \
	src/ui.js \
	src/utils.js \
	src/debug.js \
	src/end.js

radian.min.js: radian.js Makefile
	@rm -f $@
	$(JS_UGLIFY) -o $@ $<

radian%js: Makefile
	@rm -f $@
	@cat $(filter %.js,$^) > $@

#radian%js: Makefile
#	@rm -f $@
#	@cat $(filter %.js,$^) > $@.tmp
#	$(JS_UGLIFY) -b -o $@ $@.tmp
#	@rm $@.tmp
#	@chmod a-w $@

examples: radian.js src/radian.css
	@cp radian.js examples/js
	@cp src/radian.css examples/css

clean:
	rm -f radian*.js