GENERATED_FILES = \
	mx.json

.PHONY: all clean

all: $(GENERATED_FILES)

clean:
	rm -rf -- $(GENERATED_FILES) build

build/mgm2010v5_0a.zip:
	mkdir -p $(dir $@)
	curl -o $@ 'http://mapserver.inegi.org.mx/MGN/mgm2010v5_0a.zip'

build/mgm2010v5_0a.shp: build/mgm2010v5_0a.zip
	rm -rf -- $(basename $@)
	mkdir -p $(basename $@)
	unzip -d $(basename $@) $<
	for file in `find $(basename $@) -type f`; do chmod 644 $$file; mv $$file $(basename $@).$${file##*.}; done
	rm -rf -- $(basename $@)
	touch $@

build/municipalities.shp: build/mgm2010v5_0a.shp
	ogr2ogr -f 'ESRI Shapefile' -t_srs EPSG:4326 $@ $<

mx.json: build/municipalities.shp
	node_modules/.bin/topojson --simplify=2e-7 -q 1e5 -o $@ -p name=NOM_MUN -p state=+CVE_ENT -- $<

