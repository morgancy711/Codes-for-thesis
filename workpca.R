library(biomaRt)
library(DESeq2)
library(magrittr)
library(tidyverse)
library(ggfortify)

VSTpk <- read.csv("/Users/cynth/OneDrive/Documents/rnaseq1.csv",
                       row.names = 1,
                       header = TRUE,
                       )

metadata <- read.csv("/Users/cynth/OneDrive/Documents/metadata.csv",
                     row.names = 1,
                     header = TRUE)
dds <- DESeqDataSetFromMatrix(countData = VSTpk,
                              colData = metadata,
                              design = ~ Sample) %>%
  DESeq()

dds <- vst(dds)
rld <- rlog(dds)

gene.exclude <- as.numeric(which(apply(t(VSTpk), 2, var)==0))

pca_res <- prcomp(t(VSTpk)[,-gene.exclude], scale. = TRUE)
autoplot(pca_res)

ggplot(dat = pca_res$x, aes(x = PC1, y = PC2)) + 
  geom_point(aes(colour = colouring), size = 3)+
  theme_bw(
  )+xlab(paste("PC1:", round(pca_res$sdev[1]^2/sum(pca_res$sdev^2)*100, 3), "%")
         ) +ylab(paste("PC2:", round(pca_res$sdev[2]^2/sum(pca_res$sdev^2)*100, 
                                     3), "%")
         )
colouring <- c(rep("CD11b_pos", 3), rep("CD11b_neg", 3),
               rep("TN_pos", 3), rep("TN_neg", 3))
               
