all: build
all:
	@echo USE_V8LIKE: $(USE_V8LIKE)
	@echo done $@

BUILDTYPE ?= Release

USE_V8LIKE ?= 0

NODE_PATH := ..

#NODE_GEN_PATH := out/$(BUILDTYPE)/obj/gen
#NODE_GEN_PATH := gen-osx
NODE_GEN_PATH := gen/node-osx
ifneq (0,$(USE_V8LIKE))
NODE_GEN_PATH := gen/nodelike-osx
endif

# node libraries

NODE_LIBRARY_FILES += $(NODE_PATH)/src/node.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_debugger.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_linklist.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/assert.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/buffer.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/child_process.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/console.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/constants.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/crypto.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/cluster.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/dgram.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/dns.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/domain.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/events.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/freelist.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/fs.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/http.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/https.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/module.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/net.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/os.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/path.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/punycode.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/querystring.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/readline.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/repl.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/stream.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_stream_readable.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_stream_writable.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_stream_duplex.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_stream_transform.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_stream_passthrough.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/string_decoder.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/sys.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/timers.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/tls.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/tty.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/url.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/util.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/vm.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/zlib.js
NODE_LIBRARY_FILES += $(NODE_GEN_PATH)/config.gypi
NODE_LIBRARY_FILES += $(NODE_PATH)/src/macros.py
NODE_LIBRARY_FILES += $(NODE_PATH)/src/perfctr_macros.py

$(NODE_GEN_PATH)/config.gypi: config-osx.gypi
	mkdir -p $(@D) && cp -f $< $@

$(NODE_GEN_PATH)/node_natives.h: $(NODE_LIBRARY_FILES)
	mkdir -p $(@D) && python $(NODE_PATH)/tools/js2c.py $@ $(NODE_LIBRARY_FILES)

build: $(NODE_GEN_PATH)/node_natives.h

# v8 heapobjects

V8_HEAPOBJECT_FILES += $(NODE_PATH)/deps/v8/src/objects.h
V8_HEAPOBJECT_FILES += $(NODE_PATH)/deps/v8/src/objects-inl.h

$(NODE_GEN_PATH)/debug-support.cc: $(V8_HEAPOBJECT_FILES)
ifneq (0,$(USE_V8LIKE))
	mkdir -p $(@D) && touch $@
else
	mkdir -p $(@D) && python $(NODE_PATH)/deps/v8/tools/gen-postmortem-metadata.py $@ $(V8_HEAPOBJECT_FILES)
endif

build: $(NODE_GEN_PATH)/debug-support.cc

# v8 libraries

V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/runtime.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/v8natives.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/array.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/string.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/uri.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/math.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/messages.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/apinatives.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/debug-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/mirror-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/liveedit-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/date.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/json.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/regexp.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/macros.py

$(NODE_GEN_PATH)/libraries.cc: $(V8_LIBRARY_FILES)
ifneq (0,$(USE_V8LIKE))
	mkdir -p $(@D) && touch $@
else
	mkdir -p $(@D) && python $(NODE_PATH)/deps/v8/tools/js2c.py $@ CORE off $(V8_LIBRARY_FILES)
endif

build: $(NODE_GEN_PATH)/libraries.cc

# v8 experimental libraries

V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/macros.py
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/proxy.js
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/collection.js

$(NODE_GEN_PATH)/experimental-libraries.cc: $(V8_EXPERIMENTAL_LIBRARY_FILES)
ifneq (0,$(USE_V8LIKE))
	mkdir -p $(@D) && touch $@
else
	mkdir -p $(@D) && python $(NODE_PATH)/deps/v8/tools/js2c.py $@ EXPERIMENTAL off $(V8_EXPERIMENTAL_LIBRARY_FILES)
endif

build: $(NODE_GEN_PATH)/experimental-libraries.cc

