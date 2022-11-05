#!/usr/bin/env Rscript

BiocManager::install(c("BSgenome.Hsapiens.UCSC.hg19"), update=F)
devtools::install_github("cole-trapnell-lab/leidenbase", quick=T)
devtools::install_github("cole-trapnell-lab/monocle3", quick=T, dependencies="Depends", upgrade_dependcies=F)
