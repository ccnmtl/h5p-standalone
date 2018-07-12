NODE_MODULES ?= ./node_modules
BOWER_PACKAGES ?= ./bower_components
JS_SENTINAL ?= $(NODE_MODULES)/sentinal

$(JS_SENTINAL): package.json
	rm -rf $(NODE_MODULES) $(BOWER_PACKAGES) dist
	npm install
	npm run bower
	touch $(JS_SENTINAL)

build: $(JS_SENTINAL)
	npm run build	

demo: $(JS_SENTINAL)
	npm run demo 

clean:
	rm -rf $(NODE_MODULES) $(BOWER_PACKAGES) dist 

.PHONY: clean build
