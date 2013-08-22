all: build

BUILDTYPE ?= Release

#NODE_GEN_PATH := out/$(BUILDTYPE)/obj/gen
NODE_GEN_PATH := gen-ios

# node libraries

NODE_LIBRARY_FILES += src/node.js
NODE_LIBRARY_FILES += lib/_debugger.js
NODE_LIBRARY_FILES += lib/_linklist.js
NODE_LIBRARY_FILES += lib/assert.js
NODE_LIBRARY_FILES += lib/buffer.js
NODE_LIBRARY_FILES += lib/child_process.js
NODE_LIBRARY_FILES += lib/console.js
NODE_LIBRARY_FILES += lib/constants.js
NODE_LIBRARY_FILES += lib/crypto.js
NODE_LIBRARY_FILES += lib/cluster.js
NODE_LIBRARY_FILES += lib/dgram.js
NODE_LIBRARY_FILES += lib/dns.js
NODE_LIBRARY_FILES += lib/domain.js
NODE_LIBRARY_FILES += lib/events.js
NODE_LIBRARY_FILES += lib/freelist.js
NODE_LIBRARY_FILES += lib/fs.js
NODE_LIBRARY_FILES += lib/http.js
NODE_LIBRARY_FILES += lib/https.js
NODE_LIBRARY_FILES += lib/module.js
NODE_LIBRARY_FILES += lib/net.js
NODE_LIBRARY_FILES += lib/os.js
NODE_LIBRARY_FILES += lib/path.js
NODE_LIBRARY_FILES += lib/punycode.js
NODE_LIBRARY_FILES += lib/querystring.js
NODE_LIBRARY_FILES += lib/readline.js
NODE_LIBRARY_FILES += lib/repl.js
NODE_LIBRARY_FILES += lib/stream.js
NODE_LIBRARY_FILES += lib/_stream_readable.js
NODE_LIBRARY_FILES += lib/_stream_writable.js
NODE_LIBRARY_FILES += lib/_stream_duplex.js
NODE_LIBRARY_FILES += lib/_stream_transform.js
NODE_LIBRARY_FILES += lib/_stream_passthrough.js
NODE_LIBRARY_FILES += lib/string_decoder.js
NODE_LIBRARY_FILES += lib/sys.js
NODE_LIBRARY_FILES += lib/timers.js
NODE_LIBRARY_FILES += lib/tls.js
NODE_LIBRARY_FILES += lib/tty.js
NODE_LIBRARY_FILES += lib/url.js
NODE_LIBRARY_FILES += lib/util.js
NODE_LIBRARY_FILES += lib/vm.js
NODE_LIBRARY_FILES += lib/zlib.js
NODE_LIBRARY_FILES += $(NODE_GEN_PATH)/config.gypi
NODE_LIBRARY_FILES += src/macros.py
NODE_LIBRARY_FILES += src/perfctr_macros.py

$(NODE_GEN_PATH)/config.gypi: config-ios.gypi
	mkdir -p $(@D) && cp -f $< $@

$(NODE_GEN_PATH)/node_natives.h: $(NODE_LIBRARY_FILES)
	mkdir -p $(@D) && python tools/js2c.py $@ $(NODE_LIBRARY_FILES)

build: $(NODE_GEN_PATH)/node_natives.h

# v8 heapobjects

V8_HEAPOBJECT_FILES += deps/v8/src/objects.h
V8_HEAPOBJECT_FILES += deps/v8/src/objects-inl.h

$(NODE_GEN_PATH)/debug-support.cc: $(V8_HEAPOBJECT_FILES)
	mkdir -p $(@D) && python deps/v8/tools/gen-postmortem-metadata.py $@ $(V8_HEAPOBJECT_FILES)

build: $(NODE_GEN_PATH)/debug-support.cc

# v8 libraries

V8_LIBRARY_FILES += deps/v8/src/runtime.js
V8_LIBRARY_FILES += deps/v8/src/v8natives.js
V8_LIBRARY_FILES += deps/v8/src/array.js
V8_LIBRARY_FILES += deps/v8/src/string.js
V8_LIBRARY_FILES += deps/v8/src/uri.js
V8_LIBRARY_FILES += deps/v8/src/math.js
V8_LIBRARY_FILES += deps/v8/src/messages.js
V8_LIBRARY_FILES += deps/v8/src/apinatives.js
V8_LIBRARY_FILES += deps/v8/src/debug-debugger.js
V8_LIBRARY_FILES += deps/v8/src/mirror-debugger.js
V8_LIBRARY_FILES += deps/v8/src/liveedit-debugger.js
V8_LIBRARY_FILES += deps/v8/src/date.js
V8_LIBRARY_FILES += deps/v8/src/json.js
V8_LIBRARY_FILES += deps/v8/src/regexp.js
V8_LIBRARY_FILES += deps/v8/src/macros.py

$(NODE_GEN_PATH)/libraries.cc: $(V8_LIBRARY_FILES)
	mkdir -p $(@D) && python deps/v8/tools/js2c.py $@ CORE off $(V8_LIBRARY_FILES)

build: $(NODE_GEN_PATH)/libraries.cc

# v8 experimental libraries

V8_EXPERIMENTAL_LIBRARY_FILES += deps/v8/src/macros.py
V8_EXPERIMENTAL_LIBRARY_FILES += deps/v8/src/proxy.js
V8_EXPERIMENTAL_LIBRARY_FILES += deps/v8/src/collection.js

$(NODE_GEN_PATH)/experimental-libraries.cc: $(V8_EXPERIMENTAL_LIBRARY_FILES)
	mkdir -p $(@D) && python deps/v8/tools/js2c.py $@ EXPERIMENTAL off $(V8_EXPERIMENTAL_LIBRARY_FILES)

build: $(NODE_GEN_PATH)/experimental-libraries.cc

