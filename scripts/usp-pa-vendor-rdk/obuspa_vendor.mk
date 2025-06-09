CPPFLAGS += -DUSE_USPPA_VENDOR -DREMOVE_USP_BROKER -DREMOVE_USP_SERVICE -I /home/dockateci/Builds/RBUS/rbus/install/usr/include/rbus
LDFLAGS += -L/home/dockateci/Builds/RBUS/rbus/install/usr/lib -lcjson -llinenoise -lmsgpackc -lrbuscore -lrtMessage -lrbus

# libcjson.so.1      liblinenoise.so  libmsgpackc.so    libmsgpackc.so.2.0.0  librbuscore.so.0      librbus.so    librbus.so.2.3.0  librtMessage.so.0      pkgconfig
# libcjson.so  libcjson.so.1.6.0  libmsgpackc.a    libmsgpackc.so.2  librbuscore.so        librbuscore.so.2.3.0  librbus.so.0  librtMessage.so   librtMessage.so.2.3.0

src/vendor/vendor.c: ../../USPPA/usp-pa-vendor-rdk/src/vendor/vendor.c
	cp $< $@

