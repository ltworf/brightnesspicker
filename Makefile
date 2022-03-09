# brightnesspicker
# Copyright (C) 2022 Salvo "LtWorf" Tomaselli
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# author Salvo "LtWorf" Tomaselli <tiposchi@tiscali.it>

.PHONY: clean
clean:

.PHONY: dist
dist:
	rm -rf /tmp/brightnesspicker/
	rm -rf /tmp/brightnesspicker-*
	mkdir /tmp/brightnesspicker/
	cp -R * /tmp/brightnesspicker/
	( \
		cd /tmp; \
		tar --exclude '*.user' -zcf brightnesspicker.tar.gz \
			brightnesspicker/src \
			brightnesspicker/Makefile \
			brightnesspicker/LICENSE \
			brightnesspicker/README.md \
			brightnesspicker/CHANGELOG \
			brightnesspicker/CODE_OF_CONDUCT.md \
	)
	mv /tmp/brightnesspicker.tar.gz ./brightnesspicker_`head -1 CHANGELOG`.orig.tar.gz
	gpg --sign --armor --detach-sign ./brightnesspicker_`head -1 CHANGELOG`.orig.tar.gz

.PHONY: deb-pkg
deb-pkg: dist
	$(RM) -r /tmp/brightnesspicker*
	mv brightnesspicker*orig* /tmp
	cd /tmp; tar -xf brightnesspicker*orig*.gz
	cp -r debian /tmp/brightnesspicker/
	cd /tmp/brightnesspicker; dpkg-buildpackage --changes-option=-S
	mkdir -p deb-pkg
	mv /tmp/brightnesspicker*.* deb-pkg
	lintian --pedantic -E --color auto -i -I deb-pkg/*changes deb-pkg/*deb

translations:
	cd src; lupdate -verbose brightnesspicker.pro
