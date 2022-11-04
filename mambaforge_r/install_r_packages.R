#!/usr/bin/env Rscript

BiocManager::install(c("BSgenome.Hsapiens.UCSC.hg19"), update=F)
devtools::install_github("cole-trapnell-lab/leidenbase")
devtools::install_github("cole-trapnell-lab/monocle3")
