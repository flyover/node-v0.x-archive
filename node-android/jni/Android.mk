LOCAL_PATH := $(call my-dir)

NODE_ANDROID_ROOT := $(LOCAL_PATH)

NODE_PATH := ../..
NODE_ROOT := $(NODE_ANDROID_ROOT)/$(NODE_PATH)

NODE_GEN_PATH := gen/$(TARGET_ARCH_ABI)

NODE_COMMON_CFLAGS := -O2
NODE_COMMON_CFLAGS += -pthread
NODE_COMMON_CFLAGS += -fPIC
NODE_COMMON_CFLAGS += -fno-strict-aliasing
NODE_COMMON_CFLAGS += -fno-tree-vrp
NODE_COMMON_CFLAGS += -fno-exceptions
NODE_COMMON_CFLAGS += -ffunction-sections
NODE_COMMON_CFLAGS += -funwind-tables
NODE_COMMON_CFLAGS += -fstack-protector
NODE_COMMON_CFLAGS += -fno-short-enums
NODE_COMMON_CFLAGS += -finline-limit=64
NODE_COMMON_CFLAGS += -fdata-sections
NODE_COMMON_CFLAGS += -ffunction-sections
NODE_COMMON_CFLAGS += -fomit-frame-pointer
NODE_COMMON_CFLAGS += -Wall
NODE_COMMON_CFLAGS += -Wextra
NODE_COMMON_CFLAGS += -W
NODE_COMMON_CFLAGS += -Wno-abi
NODE_COMMON_CFLAGS += -Wno-unused-parameter
NODE_COMMON_CFLAGS += -Wa,--noexecstack
NODE_COMMON_CFLAGS += '-D_LARGEFILE_SOURCE'
NODE_COMMON_CFLAGS += '-D_FILE_OFFSET_BITS=64'

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
NODE_COMMON_CFLAGS += -march=armv7-a
NODE_COMMON_CFLAGS += -mtune=cortex-a9
NODE_COMMON_CFLAGS += -mfpu=neon
NODE_COMMON_CFLAGS += -mfloat-abi=softfp
endif

NODE_COMMON_CPPFLAGS := -fPIC
NODE_COMMON_CPPFLAGS += -fno-rtti
NODE_COMMON_CPPFLAGS += -Wnon-virtual-dtor
NODE_COMMON_CPPFLAGS += -Wno-error=non-virtual-dtor

NODE_COMMON_LDFLAGS := -pthread
NODE_COMMON_LDFLAGS += -rdynamic

# node

NODE_CFLAGS := $(NODE_COMMON_CFLAGS)
NODE_CFLAGS += '-DNODE_WANT_INTERNALS=1'
NODE_CFLAGS += '-DARCH="$(TARGET_ARCH)"'
NODE_CFLAGS += '-DPLATFORM="android"'
NODE_CFLAGS += '-DNODE_TAG=""'
NODE_CFLAGS += '-DHAVE_OPENSSL=1'
NODE_CFLAGS += '-D__POSIX__'
NODE_CFLAGS += '-D_POSIX_C_SOURCE=200112'

NODE_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
NODE_CPPFLAGS += $(NODE_CFLAGS)

NODE_C_INCLUDES := $(NODE_PATH)/src
NODE_C_INCLUDES += $(NODE_GEN_PATH)
NODE_C_INCLUDES += $(NODE_PATH)/deps/debugger-agent/include

NODE_EXPORT_C_INCLUDES := $(NODE_C_INCLUDES)

NODE_LDFLAGS := $(NODE_COMMON_LDFLAGS)

NODE_LDLIBS := -llog -lz -ldl -lm

NODE_SRC_FILES := $(NODE_PATH)/src/async-wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/fs_event_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/cares_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/handle_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_buffer.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_constants.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_file.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_http_parser.cc
#NODE_SRC_FILES += $(NODE_PATH)/src/node_i18n.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_javascript.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_os.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_stat_watcher.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_zlib.cc
NODE_SRC_FILES += $(NODE_PATH)/src/pipe_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/process_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/signal_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/stream_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/string_bytes.cc
NODE_SRC_FILES += $(NODE_PATH)/src/tcp_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/timer_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/tty_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/udp_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_crypto.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_contextify.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_crypto_bio.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_crypto_clienthello.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_v8.cc
NODE_SRC_FILES += $(NODE_PATH)/src/node_watchdog.cc
NODE_SRC_FILES += $(NODE_PATH)/src/smalloc.cc
NODE_SRC_FILES += $(NODE_PATH)/src/spawn_sync.cc
NODE_SRC_FILES += $(NODE_PATH)/src/tls_wrap.cc
NODE_SRC_FILES += $(NODE_PATH)/src/util.cc
NODE_SRC_FILES += $(NODE_PATH)/src/uv.cc
NODE_SRC_FILES += $(NODE_PATH)/deps/debugger-agent/src/agent.cc

NODE_LIBRARY_FILES := $(NODE_PATH)/src/node.js
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
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_agent.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_client.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_common.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_incoming.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_outgoing.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_http_server.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/https.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/module.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/net.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/os.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/path.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/punycode.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/querystring.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/readline.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/repl.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/smalloc.js
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
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_tls_common.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_tls_legacy.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/_tls_wrap.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/tty.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/url.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/util.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/vm.js
NODE_LIBRARY_FILES += $(NODE_PATH)/lib/zlib.js
NODE_LIBRARY_FILES += $(NODE_PATH)/deps/debugger-agent/lib/_debugger_agent.js
NODE_LIBRARY_FILES += ../config.gypi
NODE_LIBRARY_FILES += $(NODE_PATH)/src/notrace_macros.py
NODE_LIBRARY_FILES += $(NODE_PATH)/src/perfctr_macros.py

$(eval $(NODE_ANDROID_ROOT)/$(NODE_GEN_PATH)/node_natives.h: $(addprefix $(NODE_ANDROID_ROOT)/,$(NODE_LIBRARY_FILES)) ;\
	mkdir -p $$(@D) && python $(NODE_ROOT)/tools/js2c.py $$@ $(addprefix $(NODE_ANDROID_ROOT)/,$(NODE_LIBRARY_FILES)) )

$(eval $(NODE_ROOT)/src/node_javascript.cc: $(NODE_ANDROID_ROOT)/$(NODE_GEN_PATH)/node_natives.h )

include $(CLEAR_VARS)
LOCAL_MODULE := node
LOCAL_MODULE_FILENAME := libnode
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(NODE_CFLAGS)
LOCAL_CPPFLAGS := $(NODE_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(NODE_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(NODE_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(NODE_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(NODE_LDFLAGS)
LOCAL_STATIC_LIBRARIES := static-library-cares
LOCAL_STATIC_LIBRARIES += static-library-chrome_zlib
LOCAL_STATIC_LIBRARIES += static-library-http_parser
LOCAL_STATIC_LIBRARIES += static-library-openssl
LOCAL_STATIC_LIBRARIES += static-library-uv
LOCAL_STATIC_LIBRARIES += static-library-v8_base
LOCAL_STATIC_LIBRARIES += static-library-v8_nosnapshot
LOCAL_EXPORT_LDLIBS := $(NODE_LDLIBS)
include $(BUILD_STATIC_LIBRARY)

# node executable

include $(CLEAR_VARS)
LOCAL_MODULE := executable-node
LOCAL_MODULE_FILENAME := node
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(NODE_CFLAGS)
LOCAL_CPPFLAGS := $(NODE_CPPFLAGS)
LOCAL_SRC_FILES := $(NODE_PATH)/src/node_main.cc
LOCAL_STATIC_LIBRARIES := node
include $(BUILD_EXECUTABLE)

# cares

CARES_CFLAGS := $(NODE_COMMON_CFLAGS)
CARES_CFLAGS += '-D_GNU_SOURCE'
CARES_CFLAGS += '-DHAVE_CONFIG_H'

CARES_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
CARES_CPPFLAGS += $(CARES_CFLAGS)

CARES_C_INCLUDES := $(NODE_PATH)/deps/cares/include
CARES_C_INCLUDES += $(NODE_PATH)/deps/cares/src
CARES_C_INCLUDES += $(NODE_PATH)/deps/cares/config/android

CARES_EXPORT_C_INCLUDES := $(NODE_PATH)/deps/cares/include

CARES_LDFLAGS := $(NODE_COMMON_LDFLAGS)

CARES_SRC_FILES := $(NODE_PATH)/deps/cares/src/ares_cancel.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares__close_sockets.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_create_query.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_data.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_destroy.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_expand_name.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_expand_string.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_fds.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_free_hostent.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_free_string.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_gethostbyaddr.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_gethostbyname.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares__get_hostent.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_getnameinfo.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_getopt.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_getsock.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_init.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_library_init.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_llist.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_mkquery.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_nowarn.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_options.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_aaaa_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_a_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_mx_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_naptr_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_ns_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_ptr_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_soa_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_srv_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_parse_txt_reply.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_process.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_query.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares__read_line.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_search.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_send.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_strcasecmp.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_strdup.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_strerror.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_timeout.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares__timeval.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_version.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/ares_writev.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/bitncmp.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/inet_net_pton.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/inet_ntop.c
CARES_SRC_FILES += $(NODE_PATH)/deps/cares/src/windows_port.c

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-cares
LOCAL_MODULE_FILENAME := libcares
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(CARES_CFLAGS) '-DCARES_STATICLIB'
LOCAL_CPPFLAGS := $(CARES_CPPFLAGS) '-DCARES_STATICLIB'
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(CARES_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(CARES_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(CARES_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(CARES_LDFLAGS)
include $(BUILD_STATIC_LIBRARY)

# chrome_zlib

CHROME_ZLIB_CFLAGS := $(NODE_COMMON_CFLAGS)

CHROME_ZLIB_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
CHROME_ZLIB_CPPFLAGS += $(CHROME_ZLIB_CFLAGS)

CHROME_ZLIB_C_INCLUDES := $(NODE_PATH)/deps/zlib

CHROME_ZLIB_EXTERNAL_C_INCLUDES := $(ZLIB_C_INCLUDES)

CHROME_ZLIB_LDFLAGS := $(NODE_COMMON_LDFLAGS)

CHROME_ZLIB_SRC_FILES := $(NODE_PATH)/deps/zlib/adler32.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/compress.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/crc32.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/deflate.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/gzclose.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/gzlib.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/gzread.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/gzwrite.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/infback.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/inffast.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/inflate.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/inftrees.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/trees.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/uncompr.c
CHROME_ZLIB_SRC_FILES += $(NODE_PATH)/deps/zlib/zutil.c

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-chrome_zlib
LOCAL_MODULE_FILENAME := libchrome_zlib
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(CHROME_ZLIB_CFLAGS)
LOCAL_CPPFLAGS := $(CHROME_ZLIB_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(CHROME_ZLIB_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(CHROME_ZLIB_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(CHROME_ZLIB_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(CHROME_ZLIB_LDFLAGS)
include $(BUILD_STATIC_LIBRARY)

# http_parser

HTTP_PARSER_CFLAGS := $(NODE_COMMON_CFLAGS)
HTTP_PARSER_CFLAGS += '-DHTTP_PARSER_STRICT=0'

HTTP_PARSER_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
HTTP_PARSER_CPPFLAGS += $(HTTP_PARSER_CFLAGS)

HTTP_PARSER_C_INCLUDES := $(NODE_PATH)/deps/http_parser

HTTP_PARSER_EXPORT_C_INCLUDES := $(HTTP_PARSER_C_INCLUDES)

HTTP_PARSER_LDFLAGS := $(NODE_COMMON_LDFLAGS)

HTTP_PARSER_SRC_FILES := $(NODE_PATH)/deps/http_parser/http_parser.c

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-http_parser
LOCAL_MODULE_FILENAME := libhttp_parser
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(HTTP_PARSER_CFLAGS)
LOCAL_CPPFLAGS := $(HTTP_PARSER_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(HTTP_PARSER_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(HTTP_PARSER_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(HTTP_PARSER_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(HTTP_PARSER_LDFLAGS)
include $(BUILD_STATIC_LIBRARY)

# openssl

OPENSSL_CFLAGS := $(NODE_COMMON_CFLAGS)
OPENSSL_CFLAGS += '-DL_ENDIAN'
OPENSSL_CFLAGS += '-DPURIFY'
OPENSSL_CFLAGS += '-D_REENTRANT'
OPENSSL_CFLAGS += '-DOPENSSL_NO_HEARTBEATS'
OPENSSL_CFLAGS += '-DENGINESDIR="/dev/null"'
OPENSSL_CFLAGS += '-DOPENSSLDIR="/etc/ssl"'
OPENSSL_CFLAGS += '-DTERMIOS'
OPENSSL_CFLAGS += -Wno-missing-field-initializers
OPENSSL_CFLAGS += -Wno-old-style-declaration

OPENSSL_CFLAGS += '-DOPENSSL_NO_ASM'

OPENSSL_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
OPENSSL_CPPFLAGS += $(OPENSSL_CFLAGS)

OPENSSL_C_INCLUDES := $(NODE_PATH)/deps/openssl
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp
#OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto/md2
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes
#OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/crypto/store
OPENSSL_C_INCLUDES += $(NODE_PATH)/deps/openssl/openssl/include

OPENSSL_EXPORT_C_INCLUDES := $(NODE_PATH)/deps/openssl/openssl/include

OPENSSL_LDFLAGS := $(NODE_COMMON_LDFLAGS)

OPENSSL_SRC_FILES := $(NODE_PATH)/deps/openssl/openssl/ssl/bio_ssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_both.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_clnt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_pkt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_srtp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/d1_srvr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/kssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s23_clnt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s23_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s23_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s23_pkt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s23_srvr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_clnt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_pkt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s2_srvr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_both.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_clnt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_pkt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_srvr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/s3_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_algs.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_cert.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_ciph.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_err2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_rsa.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_sess.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_stat.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/ssl_txt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_clnt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_reneg.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/t1_srvr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/ssl/tls_srp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_cfb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_ctr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_ige.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_misc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_ofb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_wrap.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_bitstr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_bool.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_bytes.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_d2i_fp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_digest.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_dup.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_enum.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_gentm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_i2d_fp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_int.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_mbstr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_object.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_octet.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_set.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_strex.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_strnid.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_time.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_type.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_utctm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_utf8.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/a_verify.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/ameth_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn1_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn1_gen.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn1_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn1_par.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn_mime.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn_moid.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/asn_pack.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/bio_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/bio_ndef.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/d2i_pr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/d2i_pu.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/evp_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/f_enum.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/f_int.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/f_string.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/i2d_pr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/i2d_pu.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/n_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/nsseq.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/p5_pbe.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/p5_pbev2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/p8_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_bitst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_crl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_req.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_spki.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_x509.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/t_x509a.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_dec.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_fre.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_new.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_typ.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/tasn_utl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_algor.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_attrib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_bignum.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_crl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_exten.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_info.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_long.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_name.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_nx509.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_pubkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_req.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_sig.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_spki.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_val.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_x509.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/asn1/x_x509a.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bf/bf_cfb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bf/bf_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bf/bf_ofb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bf/bf_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/b_dump.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/b_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/b_sock.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bf_buff.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bf_nbio.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bf_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bio_cb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bio_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bio_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_acpt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_bio.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_conn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_dgram.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_fd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_file.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_log.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_mem.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bio/bss_sock.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_add.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_blind.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_const.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_ctx.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_depr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_div.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_exp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_exp2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_gcd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_gf2m.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_kron.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_mod.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_mont.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_mpi.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_mul.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_nist.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_prime.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_rand.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_recp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_shift.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_sqr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_sqrt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_word.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_x931p.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/buffer/buf_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/buffer/buf_str.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/buffer/buffer.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_cfb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_ctr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_ofb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_utl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cast/c_cfb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cast/c_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cast/c_ofb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cast/c_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cmac/cm_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cmac/cm_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cmac/cmac.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_att.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_cd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_dd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_env.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_ess.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_io.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_pwri.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_sd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cms/cms_smime.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/comp/c_rle.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/comp/c_zlib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/comp/comp_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/comp/comp_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_api.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_def.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_mall.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_mod.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/conf/conf_sap.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cpt_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cryptlib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cversion.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/cbc_cksm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/cbc_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/cfb64ede.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/cfb64enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/cfb_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/des_old.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/des_old2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ecb3_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ecb_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ede_cbcm_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/enc_read.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/enc_writ.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/fcrypt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ofb64ede.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ofb64enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/ofb_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/pcbc_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/qud_cksm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/rand_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/read2pwd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/rpc_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/set_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/str2key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/xcbc_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_check.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_depr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_gen.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dh/dh_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_depr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_gen.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_ossl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dsa/dsa_vrf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_beos.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_dl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_dlfcn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_openssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_vms.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/dso/dso_win32.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ebcdic.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec2_mult.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec2_oct.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec2_smpl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_check.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_curve.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_cvt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_mult.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_oct.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ec_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/eck_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_mont.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_nist.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_nistp224.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_nistp256.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_nistp521.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_nistputil.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_oct.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ec/ecp_smpl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdh/ech_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdh/ech_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdh/ech_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdh/ech_ossl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_ossl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ecdsa/ecs_vrf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_all.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_cnf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_cryptodev.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_ctrl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_dyn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_fat.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_init.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_list.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_openssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_rdrand.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_rsax.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/eng_table.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_asnmth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_cipher.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_dh.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_digest.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_dsa.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_ecdh.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_ecdsa.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_pkmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_rand.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_rsa.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/engine/tb_store.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/err/err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/err/err_all.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/err/err_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/bio_b64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/bio_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/bio_md.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/bio_ok.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/c_all.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/c_allc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/c_alld.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/digest.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_aes.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_aes_cbc_hmac_sha1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_bf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_camellia.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_cast.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_des.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_des3.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_idea.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_old.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_rc2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_rc4.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_rc4_hmac_md5.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_rc5.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_seed.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/e_xcbc_d.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/encode.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_acnf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_cnf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_fips.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_pbe.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/evp_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_dss.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_dss1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_ecdsa.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_md2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_md4.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_md5.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_mdc2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_ripemd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_sha.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_sha1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_sigver.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/m_wp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/names.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p5_crpt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p5_crpt2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_dec.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_open.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_seal.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/p_verify.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/pmeth_fn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/pmeth_gn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/evp/pmeth_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ex_data.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/fips_ers.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/hmac/hm_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/hmac/hm_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/hmac/hmac.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/idea/i_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/idea/i_cfb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/idea/i_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/idea/i_ofb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/idea/i_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/krb5/krb5_asn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/lhash/lh_stats.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/lhash/lhash.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md2/md2_dgst.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md2/md2_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md4/md4_dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md4/md4_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md5/md5_dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/md5/md5_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/mdc2/mdc2_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/mdc2/mdc2dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/mem.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/mem_dbg.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/cbc128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/ccm128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/cfb128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/ctr128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/cts128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/gcm128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/ofb128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/modes/xts128.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/o_dir.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/o_fips.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/o_init.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/o_str.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/o_time.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/objects/o_names.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/objects/obj_dat.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/objects/obj_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/objects/obj_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/objects/obj_xref.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_asn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_cl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_ext.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_ht.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_srv.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ocsp/ocsp_vfy.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_all.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_info.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_oth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_pk8.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_pkey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_seal.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_x509.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pem_xaux.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pem/pvkfmt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_add.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_asn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_attr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_crpt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_crt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_decr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_init.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_key.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_kiss.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_mutl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_npas.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_p8d.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_p8e.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/p12_utl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs12/pk12err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/bio_pk7.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_attr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_doit.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_mime.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pk7_smime.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pkcs7/pkcs7err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/pqueue/pqueue.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/md_rand.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_egd.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_nw.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_os2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_unix.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/rand_win.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rand/randfile.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc2/rc2_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc2/rc2_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc2/rc2_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc2/rc2cfb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc2/rc2ofb64.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc4/rc4_utl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ripemd/rmd_dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ripemd/rmd_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_ameth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_chk.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_crpt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_depr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_eay.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_gen.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_none.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_null.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_oaep.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_pk1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_pmeth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_pss.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_saos.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_ssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rsa/rsa_x931.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/seed/seed.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/seed/seed_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/seed/seed_cfb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/seed/seed_ecb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/seed/seed_ofb.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha1_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha1dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha256.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha512.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha_dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/sha/sha_one.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/srp/srp_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/srp/srp_vfy.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/stack/stack.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/store/str_err.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/store/str_lib.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/store/str_mem.c
#OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/store/str_meth.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_asn1.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_conf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_req_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_req_utils.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_rsp_print.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_rsp_sign.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_rsp_utils.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_rsp_verify.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ts/ts_verify_ctx.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/txt_db/txt_db.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ui/ui_compat.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ui/ui_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ui/ui_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ui/ui_openssl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/ui/ui_util.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/uid.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/whrlpool/wp_dgst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/by_dir.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/by_file.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_att.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_cmp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_d2.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_def.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_ext.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_lu.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_obj.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_r2x.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_req.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_set.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_trs.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_txt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_v3.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_vfy.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509_vpm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509cset.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509name.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509rset.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509spki.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x509type.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509/x_all.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_cache.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_data.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_map.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_node.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/pcy_tree.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_addr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_akey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_akeya.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_alt.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_asid.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_bcons.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_bitst.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_conf.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_cpols.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_crld.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_enum.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_extku.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_genn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_ia5.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_info.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_int.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_lib.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_ncons.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_ocsp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_pci.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_pcia.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_pcons.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_pku.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_pmaps.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_prn.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_purp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_sxnet.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3_utl.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/x509v3/v3err.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_4758cca.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_aep.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_atalla.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_capi.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_chil.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_cswift.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_gmp.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_nuron.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_sureware.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/engines/e_ubsec.c

OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/aes/aes_core.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bf/bf_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/bn/bn_asm.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/cast/c_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/camellia.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_cbc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/camellia/cmll_misc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/des_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/des/fcrypt_b.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/mem_clr.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc4/rc4_enc.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/rc4/rc4_skey.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/whrlpool/wp_block.c

ifeq ($(TARGET_ARCH),arm)
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/armcap.c
OPENSSL_SRC_FILES += $(NODE_PATH)/deps/openssl/openssl/crypto/armv4cpuid.S
endif

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-openssl
LOCAL_MODULE_FILENAME := libopenssl
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(OPENSSL_CFLAGS)
LOCAL_CPPFLAGS := $(OPENSSL_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(OPENSSL_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(OPENSSL_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(OPENSSL_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(OPENSSL_LDFLAGS)
LOCAL_SHORT_COMMANDS := true # Argument list too long
include $(BUILD_STATIC_LIBRARY)

# uv

UV_CFLAGS := $(NODE_COMMON_CFLAGS)
UV_CFLAGS += '-DUSE_UV_WRAP'
UV_CFLAGS += '-D_GNU_SOURCE'
UV_CFLAGS += '-DHAVE_CONFIG_H'
UV_CFLAGS += -Wstrict-aliasing

UV_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
UV_CPPFLAGS += $(UV_CFLAGS)

UV_C_INCLUDES := $(NODE_PATH)/deps/uv/include
UV_C_INCLUDES += $(NODE_PATH)/deps/uv/src

UV_EXPORT_C_INCLUDES := $(NODE_PATH)/deps/uv/include

UV_LDFLAGS := $(NODE_COMMON_LDFLAGS)

UV_SRC_FILES := $(NODE_PATH)/deps/uv/src/fs-poll.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/inet.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/threadpool.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/uv-common.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/version.c

UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/async.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/core.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/dl.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/fs.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/getaddrinfo.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/getnameinfo.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/loop.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/loop-watcher.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/pipe.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/poll.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/process.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/signal.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/stream.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/tcp.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/thread.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/timer.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/tty.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/udp.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/proctitle.c

UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/linux-core.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/linux-inotify.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/linux-syscalls.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/pthread-fixes.c
UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/android-ifaddrs.c

UV_SRC_FILES += $(NODE_PATH)/deps/uv/src/unix/wrap.c # USE_UV_WRAP

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-uv
LOCAL_MODULE_FILENAME := libuv
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(UV_CFLAGS)
LOCAL_CPPFLAGS := $(UV_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(UV_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(UV_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(UV_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(UV_LDFLAGS)
include $(BUILD_STATIC_LIBRARY)

# v8

V8_CFLAGS := $(NODE_COMMON_CFLAGS)
V8_CFLAGS += '-DANDROID'
V8_CFLAGS += '-DV8_ANDROID_LOG_STDOUT'
V8_CFLAGS += '-DENABLE_DEBUGGER_SUPPORT'
V8_CFLAGS += '-DCAN_USE_UNALIGNED_ACCESSES=0'
V8_CFLAGS += '-DCAN_USE_VFP_INSTRUCTIONS'
V8_CFLAGS += '-DUSE_STLPORT=1'
V8_CFLAGS += '-D_STLP_USE_PTR_SPECIALIZATIONS=1'
V8_CFLAGS += '-DHAVE_OFF64_T'
V8_CFLAGS += '-DHAVE_SYS_UIO_H'
V8_CFLAGS += '-DANDROID_BINSIZE_HACK'

#V8_CFLAGS += '-DENABLE_EXTRA_CHECKS'

ifeq ($(TARGET_ARCH),arm)
V8_CFLAGS += '-DV8_TARGET_ARCH_ARM'
endif

ifeq ($(TARGET_ARCH),arm64)
V8_CFLAGS += '-DV8_TARGET_ARCH_ARM64'
endif

ifeq ($(TARGET_ARCH),x86)
V8_CFLAGS += '-DV8_TARGET_ARCH_IA32'
endif

ifeq ($(TARGET_ARCH),mips)
V8_CFLAGS += '-DV8_TARGET_ARCH_MIPS'
endif

ifeq ($(TARGET_ARCH),mips64)
V8_CFLAGS += '-DV8_TARGET_ARCH_MIPS64'
endif

ifeq ($(TARGET_ARCH),x86_64)
V8_CFLAGS += '-DV8_TARGET_ARCH_X64'
endif

V8_CPPFLAGS := $(NODE_COMMON_CPPFLAGS)
V8_CPPFLAGS += $(V8_CFLAGS)

V8_C_INCLUDES := $(NODE_PATH)/deps/v8

V8_EXPORT_C_INCLUDES := $(NODE_PATH)/deps/v8/include

V8_LDFLAGS := $(NODE_COMMON_LDFLAGS)

# v8_base

V8_BASE_SRC_FILES := $(NODE_PATH)/deps/v8/src/accessors.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/accessors.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation-site-scopes.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation-site-scopes.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation-tracker.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/allocation-tracker.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/api.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/api.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arguments.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arguments.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/assembler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/assembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/assert-scope.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/assert-scope.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ast-value-factory.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ast-value-factory.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ast.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ast.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bignum-dtoa.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bignum-dtoa.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bignum.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bignum.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bootstrapper.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bootstrapper.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/builtins.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/builtins.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/bytecodes-irregexp.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/cached-powers.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/cached-powers.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/char-predicates-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/char-predicates.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/checks.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/checks.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/circular-queue-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/circular-queue.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/code-stubs.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/code-stubs.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/code-stubs-hydrogen.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/code.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/codegen.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/codegen.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compilation-cache.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compilation-cache.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ast-graph-builder.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ast-graph-builder.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/code-generator-impl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/code-generator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/code-generator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/common-node-cache.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/common-operator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/control-builders.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/control-builders.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/frame.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/gap-resolver.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/gap-resolver.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/generic-algorithm-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/generic-algorithm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/generic-graph.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/generic-node-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/generic-node.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-builder.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-builder.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-reducer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-reducer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-replay.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-replay.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-visualizer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph-visualizer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/graph.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction-codes.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction-selector-impl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction-selector.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction-selector.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/instruction.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-context-specialization.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-context-specialization.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-generic-lowering.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-generic-lowering.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-graph.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-graph.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-operator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-typed-lowering.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/js-typed-lowering.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/linkage-impl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/linkage.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/linkage.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/lowering-builder.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/lowering-builder.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/machine-node-factory.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/machine-operator-reducer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/machine-operator-reducer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/machine-operator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/machine-type.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-aux-data-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-aux-data.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-cache.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-cache.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-matchers.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-properties-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node-properties.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/node.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/opcodes.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/operator-properties-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/operator-properties.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/operator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/phi-reducer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/pipeline.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/pipeline.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/raw-machine-assembler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/raw-machine-assembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/register-allocator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/register-allocator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/representation-change.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/schedule.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/schedule.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/scheduler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/scheduler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/simplified-lowering.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/simplified-lowering.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/simplified-node-factory.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/simplified-operator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/source-position.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/source-position.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/structured-machine-assembler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/structured-machine-assembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/typer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/typer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/verifier.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/verifier.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/contexts.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/contexts.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/conversions-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/conversions.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/conversions.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/counters.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/counters.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/cpu-profiler-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/cpu-profiler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/cpu-profiler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/data-flow.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/data-flow.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/date.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/date.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/dateparser-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/dateparser.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/dateparser.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/debug.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/debug.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/deoptimizer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/deoptimizer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/disasm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/disassembler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/disassembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/diy-fp.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/diy-fp.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/double.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/dtoa.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/dtoa.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/effects.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/elements-kind.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/elements-kind.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/elements.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/elements.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/execution.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/execution.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/externalize-string-extension.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/externalize-string-extension.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/free-buffer-extension.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/free-buffer-extension.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/gc-extension.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/gc-extension.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/statistics-extension.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/statistics-extension.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/trigger-failure-extension.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/extensions/trigger-failure-extension.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/factory.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/factory.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/fast-dtoa.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/fast-dtoa.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/feedback-slots.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/field-index.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/field-index.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/field-index-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/fixed-dtoa.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/fixed-dtoa.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/flag-definitions.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/flags.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/flags.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/frames-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/frames.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/frames.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/full-codegen.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/full-codegen.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/func-name-inferrer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/func-name-inferrer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/gdb-jit.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/gdb-jit.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/global-handles.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/global-handles.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/globals.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/handles-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/handles.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/handles.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hashmap.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap-profiler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap-profiler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap-snapshot-generator-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap-snapshot-generator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap-snapshot-generator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/gc-tracer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/gc-tracer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/heap-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/heap.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/heap.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/incremental-marking-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/incremental-marking.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/incremental-marking.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/mark-compact-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/mark-compact.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/mark-compact.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/objects-visiting-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/objects-visiting.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/objects-visiting.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/spaces-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/spaces.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/spaces.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/store-buffer-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/store-buffer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/store-buffer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/sweeper-thread.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/heap/sweeper-thread.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-alias-analysis.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-bce.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-bce.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-bch.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-bch.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-canonicalize.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-canonicalize.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-check-elimination.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-check-elimination.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-dce.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-dce.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-dehoist.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-dehoist.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-environment-liveness.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-environment-liveness.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-escape-analysis.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-escape-analysis.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-flow-engine.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-instructions.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-instructions.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-gvn.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-gvn.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-infer-representation.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-infer-representation.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-infer-types.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-infer-types.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-load-elimination.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-load-elimination.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-mark-deoptimize.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-mark-deoptimize.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-mark-unreachable.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-mark-unreachable.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-osr.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-osr.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-range-analysis.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-range-analysis.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-redundant-phi.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-redundant-phi.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-removable-simulates.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-removable-simulates.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-representation-changes.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-representation-changes.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-sce.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-sce.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-store-elimination.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-store-elimination.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-types.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-types.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-uint32-analysis.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/hydrogen-uint32-analysis.h
#V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/i18n.cc
#V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/i18n.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/icu_util.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/icu_util.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ic-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ic.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ic.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/interface.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/interface.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/interpreter-irregexp.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/interpreter-irregexp.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/isolate.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/isolate.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/json-parser.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/json-stringifier.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/jsregexp-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/jsregexp.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/jsregexp.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/list-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/list.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-allocator-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-allocator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-allocator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-codegen.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-codegen.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lithium-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/liveedit.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/liveedit.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/log-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/log-utils.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/log-utils.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/log.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/log.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lookup-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lookup.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/lookup.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/macro-assembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/messages.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/messages.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/msan.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/natives.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/objects-debug.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/objects-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/objects-printer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/objects.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/objects.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/optimizing-compiler-thread.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/optimizing-compiler-thread.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ostreams.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ostreams.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/parser.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/parser.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/perf-jit.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/perf-jit.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/preparse-data-format.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/preparse-data.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/preparse-data.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/preparser.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/preparser.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/prettyprinter.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/prettyprinter.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/profile-generator-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/profile-generator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/profile-generator.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/property-details.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/property.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/property.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/prototype.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler-irregexp-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler-irregexp.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler-irregexp.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler-tracer.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler-tracer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-macro-assembler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-stack.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/regexp-stack.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/rewriter.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/rewriter.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/runtime-profiler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/runtime-profiler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/runtime.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/runtime.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/safepoint-table.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/safepoint-table.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/sampler.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/sampler.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scanner-character-streams.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scanner-character-streams.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scanner.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scanner.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scopeinfo.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scopeinfo.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scopes.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/scopes.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/serialize.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/serialize.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/small-pointer-list.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/smart-pointers.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/snapshot.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/snapshot-source-sink.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/snapshot-source-sink.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/string-search.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/string-search.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/string-stream.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/string-stream.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/strtod.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/strtod.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/stub-cache.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/stub-cache.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/token.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/token.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/transitions-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/transitions.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/transitions.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/type-info.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/type-info.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/types-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/types.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/types.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/typing.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/typing.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unbound-queue-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unbound-queue.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unicode-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unicode.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unicode.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/unique.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/uri.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/utils-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/utils.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/utils.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/v8.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/v8.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/v8memory.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/v8threads.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/v8threads.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/variables.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/variables.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/vector.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/version.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/version.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/vm-state-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/vm-state.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/zone-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/zone.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/zone.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/third_party/fdlibm/fdlibm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/third_party/fdlibm/fdlibm.h

ifeq ($(TARGET_ARCH),arm)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/assembler-arm-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/assembler-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/assembler-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/builtins-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/code-stubs-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/code-stubs-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/codegen-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/codegen-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/constants-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/constants-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/cpu-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/debug-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/deoptimizer-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/disasm-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/frames-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/frames-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/full-codegen-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/ic-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-codegen-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-codegen-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-gap-resolver-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/lithium-gap-resolver-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/macro-assembler-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/macro-assembler-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/regexp-macro-assembler-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/regexp-macro-assembler-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/simulator-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm/stub-cache-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm/code-generator-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm/instruction-codes-arm.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm/instruction-selector-arm.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm/linkage-arm.cc
endif

ifeq ($(TARGET_ARCH),arm64)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/assembler-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/assembler-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/assembler-arm64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/builtins-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/codegen-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/codegen-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/code-stubs-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/code-stubs-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/constants-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/cpu-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/debug-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/decoder-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/decoder-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/decoder-arm64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/delayed-masm-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/delayed-masm-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/delayed-masm-arm64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/deoptimizer-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/disasm-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/disasm-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/frames-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/frames-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/full-codegen-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/ic-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/instructions-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/instructions-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/instrument-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/instrument-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-codegen-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-codegen-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-gap-resolver-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/lithium-gap-resolver-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/macro-assembler-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/macro-assembler-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/macro-assembler-arm64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/regexp-macro-assembler-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/regexp-macro-assembler-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/simulator-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/simulator-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/stub-cache-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/utils-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/arm64/utils-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm64/code-generator-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm64/instruction-codes-arm64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm64/instruction-selector-arm64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/arm64/linkage-arm64.cc
endif

ifeq ($(TARGET_ARCH),x86)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/assembler-ia32-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/assembler-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/assembler-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/builtins-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/code-stubs-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/code-stubs-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/codegen-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/codegen-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/cpu-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/debug-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/deoptimizer-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/disasm-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/frames-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/frames-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/full-codegen-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/ic-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-codegen-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-codegen-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-gap-resolver-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-gap-resolver-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/lithium-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/macro-assembler-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/macro-assembler-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/regexp-macro-assembler-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/regexp-macro-assembler-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/ia32/stub-cache-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ia32/code-generator-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ia32/instruction-codes-ia32.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ia32/instruction-selector-ia32.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/ia32/linkage-ia32.cc
endif

ifeq ($(TARGET_ARCH),mips)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/assembler-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/assembler-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/assembler-mips-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/builtins-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/codegen-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/codegen-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/code-stubs-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/code-stubs-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/constants-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/constants-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/cpu-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/debug-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/deoptimizer-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/disasm-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/frames-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/frames-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/full-codegen-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/ic-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-codegen-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-codegen-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-gap-resolver-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-gap-resolver-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/lithium-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/macro-assembler-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/macro-assembler-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/regexp-macro-assembler-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/regexp-macro-assembler-mips.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/simulator-mips.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips/stub-cache-mips.cc
endif

ifeq ($(TARGET_ARCH),mips64)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/assembler-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/assembler-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/assembler-mips64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/builtins-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/codegen-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/codegen-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/code-stubs-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/code-stubs-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/constants-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/constants-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/cpu-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/debug-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/deoptimizer-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/disasm-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/frames-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/frames-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/full-codegen-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/ic-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-codegen-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-codegen-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-gap-resolver-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-gap-resolver-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/lithium-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/macro-assembler-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/macro-assembler-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/regexp-macro-assembler-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/regexp-macro-assembler-mips64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/simulator-mips64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/mips64/stub-cache-mips64.cc
endif

ifeq ($(TARGET_ARCH),x86_64)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/assembler-x64-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/assembler-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/assembler-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/builtins-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/code-stubs-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/code-stubs-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/codegen-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/codegen-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/cpu-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/debug-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/deoptimizer-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/disasm-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/frames-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/frames-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/full-codegen-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/ic-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-codegen-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-codegen-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-gap-resolver-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-gap-resolver-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/lithium-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/macro-assembler-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/macro-assembler-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/regexp-macro-assembler-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/regexp-macro-assembler-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x64/stub-cache-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/x64/code-generator-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/x64/instruction-codes-x64.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/x64/instruction-selector-x64.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/compiler/x64/linkage-x64.cc
endif

ifeq ($(TARGET_ARCH),x87)
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/assembler-x87-inl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/assembler-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/assembler-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/builtins-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/code-stubs-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/code-stubs-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/codegen-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/codegen-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/cpu-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/debug-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/deoptimizer-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/disasm-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/frames-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/frames-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/full-codegen-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/ic-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-codegen-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-codegen-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-gap-resolver-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-gap-resolver-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/lithium-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/macro-assembler-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/macro-assembler-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/regexp-macro-assembler-x87.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/regexp-macro-assembler-x87.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/x87/stub-cache-x87.cc
endif

V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_arm64_gcc.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_arm_gcc.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_atomicword_compat.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_mac.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_mips_gcc.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_tsan.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_x86_gcc.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_x86_gcc.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/atomicops_internals_x86_msvc.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/build_config.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/cpu.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/cpu.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/lazy-instance.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/logging.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/logging.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/macros.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/once.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/once.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/elapsed-timer.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/time.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/time.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/condition-variable.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/condition-variable.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/mutex.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/mutex.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/platform.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/semaphore.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/semaphore.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/safe_conversions.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/safe_conversions_impl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/safe_math.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/safe_math_impl.h
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/utils/random-number-generator.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/utils/random-number-generator.h

V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/platform-posix.cc
V8_BASE_SRC_FILES += $(NODE_PATH)/deps/v8/src/base/platform/platform-linux.cc

V8_HEAPOBJECT_FILES := $(NODE_PATH)/deps/v8/src/objects.h
V8_HEAPOBJECT_FILES += $(NODE_PATH)/deps/v8/src/objects-inl.h

$(eval $(NODE_ANDROID_ROOT)/$(NODE_GEN_PATH)/debug-support.cc: $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_HEAPOBJECT_FILES)) ;\
	mkdir -p $$(@D) && python $(NODE_ROOT)/deps/v8/tools/gen-postmortem-metadata.py $$@ $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_HEAPOBJECT_FILES)) )

V8_BASE_SRC_FILES += $(NODE_GEN_PATH)/debug-support.cc

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-v8_base
LOCAL_MODULE_FILENAME := libv8_base
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(V8_CFLAGS)
LOCAL_CPPFLAGS := $(V8_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(filter %.cc,$(V8_BASE_SRC_FILES))
LOCAL_EXPORT_LDFLAGS := $(V8_LDFLAGS)
LOCAL_SHORT_COMMANDS := true # Argument list too long
include $(BUILD_STATIC_LIBRARY)

# v8_nosnapshot

V8_NOSNAPSHOT_SRC_FILES := $(NODE_PATH)/deps/v8/src/snapshot-common.cc
V8_NOSNAPSHOT_SRC_FILES += $(NODE_PATH)/deps/v8/src/snapshot-empty.cc

V8_LIBRARY_FILES := $(NODE_PATH)/deps/v8/src/runtime.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/v8natives.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/symbol.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/array.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/string.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/uri.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/third_party/fdlibm/fdlibm.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/math.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/messages.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/apinatives.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/debug-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/mirror-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/liveedit-debugger.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/date.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/json.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/regexp.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/arraybuffer.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/typedarray.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/weak_collection.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/promise.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/object-observe.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/collection.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/collection-iterator.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/macros.py
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/array-iterator.js
V8_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/string-iterator.js

$(eval $(NODE_ANDROID_ROOT)/$(NODE_GEN_PATH)/libraries.cc: $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_LIBRARY_FILES)) ;\
	mkdir -p $$(@D) && python $(NODE_ROOT)/deps/v8/tools/js2c.py $$@ CORE off $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_LIBRARY_FILES)) )

V8_NOSNAPSHOT_SRC_FILES += $(NODE_GEN_PATH)/libraries.cc

V8_EXPERIMENTAL_LIBRARY_FILES := $(NODE_PATH)/deps/v8/src/macros.py
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/proxy.js
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/generator.js
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/harmony-string.js
V8_EXPERIMENTAL_LIBRARY_FILES += $(NODE_PATH)/deps/v8/src/harmony-array.js

$(eval $(NODE_ANDROID_ROOT)/$(NODE_GEN_PATH)/experimental-libraries.cc: $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_EXPERIMENTAL_LIBRARY_FILES)) ;\
	mkdir -p $$(@D) && python $(NODE_ROOT)/deps/v8/tools/js2c.py $$@ EXPERIMENTAL off $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_EXPERIMENTAL_LIBRARY_FILES)) )

V8_NOSNAPSHOT_SRC_FILES += $(NODE_GEN_PATH)/experimental-libraries.cc

include $(CLEAR_VARS)
LOCAL_MODULE := static-library-v8_nosnapshot
LOCAL_MODULE_FILENAME := libv8_nosnapshot
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_ARM_NEON := true
endif
LOCAL_CFLAGS := $(V8_CFLAGS)
LOCAL_CPPFLAGS := $(V8_CPPFLAGS)
LOCAL_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_C_INCLUDES))
LOCAL_EXPORT_C_INCLUDES := $(addprefix $(NODE_ANDROID_ROOT)/,$(V8_EXPORT_C_INCLUDES))
LOCAL_SRC_FILES := $(V8_NOSNAPSHOT_SRC_FILES)
LOCAL_EXPORT_LDFLAGS := $(V8_LDFLAGS)
include $(BUILD_STATIC_LIBRARY)

