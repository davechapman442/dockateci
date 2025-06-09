CPPFLAGS += -DUSE_USPPA_VENDOR -DREMOVE_USP_BROKER -DREMOVE_USP_SERVICE -I /home/dockateci/Builds/RBUS/rbus/install/usr/include/rbus
LDFLAGS += -L/home/dockateci/Builds/RBUS/rbus/install/usr/lib -lcjson -llinenoise -lmsgpackc -lrbuscore -lrtMessage -lrbus

src/vendor/vendor.c: ../../USPPA/usp-pa-vendor-rdk/src/vendor/vendor.c
	cp $< $@

