VERSION := "0.1.$(shell sh -c svnversion -c | sed -e 's/M/.99/')"

.SILENT:
.PHONEY: clean test check build install package data usage help

usage:
	echo "Available targets:"
	echo ""
	echo " install  - install the package, writing the output into install.log"
	echo " check    - run R CMD check on the package"
	echo " help     - shows all available targets"

help: usage
	echo " clean    - clean up package cruft"
	echo " pkg      - roxygenize skel/ into pkg/"

install: clean pkg
	echo "Installing package..."
	R CMD INSTALL pkg > install.log 2>&1

test: install
	echo "Running unit tests..."
	Rscript pkg/inst/unittests/runner.r

check: pkg
	echo "Running R CMD check..."
	R CMD check pkg && rm -fR pkg.Rcheck

clean:
	echo "Cleaning up..."
	rm -fR skel/src/*.o skel/src/*.so skel.Rcheck
	rm -fR pkg
	rm -fR .RData .Rhistory build.log install.log roxygen.log

pkg: clean
	echo "Updating 'Version' field..."
	sed -i '' -e "s/^Version: UNKNOWN/Version: ${VERSION}/g" skel/DESCRIPTION
	echo "Roxygenizing package..."
	./roxygenize > roxygen.log 2>&1
	sed -i '' -e "s/^Version:.*/Version: UNKNOWN/g" skel/DESCRIPTION

version:
	echo ${VERSION}