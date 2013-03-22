soobench
========

Build instructions
------------------

To build a source package, run

  make package

in the root directory of the checkout. Alternativly, if you want to
immediately install the package, run

  make install

Further build options are available. Check the output of

  make

for a short list.

Running the unit tests
----------------------

To run the included test suite, type

  make test

You can skip the (time consuming) BBOB tests if you are not working on
their code by setting SKIP_BBOB to 1. I.e.

  make test SKIP_BBOB=1
