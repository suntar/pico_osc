all:
	make -C pico_rec
	make -C sig_filter
	make -C sig_viewer

dir=/usr$(subst ${prefix},,${libdir})/tcl

name=SigLoad
ver=1.0

install: all
	mkdir -p ${bindir} ${libdir}/tcl/ ${datadir}/tcl/${name}-${ver}
	install pico_rec/pico_rec sig_filter/sig_filter ${bindir}
	install -m644 sig_viewer/sig_load.so ${libdir}/tcl/
	sed 's|%LIB_DIR%|${dir}|' sig_viewer/pkgIndex.tcl > ${datadir}/tcl/${name}-${ver}/pkgIndex.tcl
	sed 's|^load ./sig_load.so|package require SigLoad|' sig_viewer/sig_viewer ${bindir}
	chmod 755 ${bindir}/sig_viewer

#



