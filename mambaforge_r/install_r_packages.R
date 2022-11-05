#!/usr/bin/env Rscript

BiocManager::install(c("BSgenome.Hsapiens.UCSC.hg19"), update=F)
BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats',
                       'limma', 'lme4', 'S4Vectors', 'SingleCellExperiment',
                       'SummarizedExperiment', 'batchelor', 'Matrix.utils',
                       'HDF5Array', 'terra', 'ggrastr'))
# devtools::install_github("cole-trapnell-lab/leidenbase", quick=T)
devtools::install_github("cole-trapnell-lab/monocle3", quick=T)
