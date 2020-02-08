# soobench
Collection of single objective optimization test problems for R.

## Install from github

Run this in R to install the current GitHub version (requires the `devtools`
package):

```splus
library("devtools")
install_github("opsani/soobench")
```

## Development

If you make changes, before you submit a PR, please help me out by running
```
./do check
```
to ensure the changes will be accepted by the CRAN team.

### Portability concerns
To check using the `gcc10 -fno-common` [requirement](https://cran.r-project.org/doc/manuals/r-release/R-exts.html#Portable-C-and-C_002b_002b-code),
use
```
withr::with_makevars(
  c(
    "CFLAGS"="-Wall -pedantic -fdiagnostics-color=always -fno-common"
  ),
  devtools::check()
)
```

[![CRAN Status Badge](http://www.r-pkg.org/badges/version/soobench)](http://cran.r-project.org/web/packages/soobench)
[![CRAN Downloads](http://cranlogs.r-pkg.org/badges/soobench)](http://cran.rstudio.com/web/packages/soobench/index.html)

