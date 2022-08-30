#!/usr/bin/env Rscript
cran_install_or_fail = function(package_name) {
  tryCatch({
    install.packages(package_name, dependencies=T);
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

bioc_install_or_fail = function(package_name) {
  tryCatch({
    BiocManager::install(package_name, dependencies=T);
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

devtools_install_or_fail = function(package_name) {
  tryCatch({
    devtools::install_github(package_name, dependencies=T);
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

cran_install_or_fail(c("devtools", "BiocManager"))
bioc_install_or_fail(c("BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "lme4", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment", "batchelor", "ggrastr", "remotes", "Seurat"))
devtools_install_or_fail("cole-trapnell-lab/leidenbase")
devtools_install_or_fail("cole-trapnell-lab/monocle3")

