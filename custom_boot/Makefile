arch     := $(shell uname -m)
tmpdir   := $(shell mktemp -q -d /tmp/git_custom_kiwi_boot.XXXXXX)
buildroot = /
kiwi_boot_images = ${buildroot}/usr/share/kiwi/custom_boot

LC = LC_MESSAGES

po:
	./.locale
	for i in `ls -1 locale`; do \
		if [ -d ./locale/$$i ];then \
			if [ ! "$$i" = "kiwi-help" ] && [ ! "$$i" = "kiwi-template" ];then \
				(cd ./locale/$$i/${LC} && msgfmt -o kiwi.mo kiwi.po);\
			fi \
		fi \
	done
	for boot_arch in arch/*; do \
		if [ ! -L $$boot_arch ] && [ ! -f $$boot_arch ];then \
			for boot_image in $$boot_arch/*/*/root; do \
				mkdir -p $$boot_image/usr/share/locale ;\
				cp -a locale/* $$boot_image/usr/share/locale/ ;\
				rm -rf $$boot_image/usr/share/locale/kiwi-template ;\
				rm -rf $$boot_image/usr/share/locale/*/LC_MESSAGES/kiwi.po ;\
			done \
		fi \
	done

install: po
	install -d -m 755 ${kiwi_boot_images}
	install -m 644 functions.sh ${kiwi_boot_images}
	cp -a arch/${arch}/* ${kiwi_boot_images}
	(cd ${kiwi_boot_images}; for i in `find -name include`; do \
		rm -f $$i;\
		(cd `dirname $$i`; ln -s ../../../functions.sh include);\
	done)

build:
	# provide rpm boot packages source
	# metadata for the buildservice when kiwi is used in the
	# buildservice this data is needed
	tar -C .. -czf ${tmpdir}/kiwi-boot-descriptions.tar.gz custom_boot
	helper/kiwi-boot-packages > ${tmpdir}/kiwi-boot-packages
	cp package/* ${tmpdir}
