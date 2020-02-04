# devtools 1.9.18

* Maintenance update to pass `R CMD check` [bugfix](https://bugs.r-project.org/bugzilla/show_bug.cgi?id=16223)

# devtools 1.9.12

* Maintenance update to pass recent CRAN standards changes including:
  - C foreign function registration in `soobench.c` to satisfy the [canonical C FFI](https://cran.r-project.org/doc/manuals/R-exts.html#Registering-native-routines).
  - Various pragma fixes for `roxygen2` and additions thereto for `NAMESPACE` compliance with ibid.
  - Spellchecks, defaulting to American English

