#!/usr/bin/env Rscript

BiocManager::install(c("BSgenome.Hsapiens.UCSC.hg19"), update=F)
devtools::install("cole-trapnell-lab/leidenbase")
devtools::install("cole-trapnell-lab/monocle3")
