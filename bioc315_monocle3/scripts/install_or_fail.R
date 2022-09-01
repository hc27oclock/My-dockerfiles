#!/usr/bin/env Rscript
install_or_fail = function(package_name, pack="cran") {
  if (pack == "cran") {
    installfunc = "install.packages"
  }
  if (pack == "bioc") {
    installfunc = "BiocManager::install"
  }
  if (pack == "devtools") {
    installfunc = "devtools::install_github"
  }

  tryCatch({
    eval(parse(text=paste0(installfunc, "(\"", package_name, "\", dependencies=NA)")));
    library(package_name)},
    error=function(e) {print(e)},
    warning=function(w) {
      catch = grepl("download of package .* failed", w$message) ||
        grepl("(dependenc|package).*(is|are) not available", w$message) ||
        grepl("installation of package.*had non-zero exit status", w$message) ||
        grepl("installation of one or more packages failed", w$message)
      if (catch) {
        print(w$message);
        stop(paste0("installation failed for: ", package_name))
      }
    }
  )
}

install_or_fail(c("BiocManager", "devtools"), pack="cran")
install_or_fail(c("BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "lme4", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment", "batchelor", "ggrastr", "remotes"), pack="bioc")
install_or_fail("cole-trapnell-lab/leidenbase", pack="devtools")
install_or_fail("cole-trapnell-lab/monocle3", pack="devtools")
install_or_fail("Seurat", pack="cran")


