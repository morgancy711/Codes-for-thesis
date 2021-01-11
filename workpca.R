library(biomaRt)
library(DESeq2)
library(magrittr)
library(tidyverse)

raw_counts <- read.csv("/Users/cynth/rnaseq.csv",
                       row.names = 1,
                       header = TRUE)
metadata <- read.csv("/Users/cynth/metadata.csv",
                     row.names = 1,
                     header = TRUE)
dds <- DESeqDataSetFromMatrix(countData = raw_counts,
                              colData = metadata,
                              design = ~ Sample) %>%
  DESeq()

dds <- vst(dds)
rld <- rlog(dds)



  print( plotPCA(rld, intgroup = c( "Cell", "Antigen")) )

       