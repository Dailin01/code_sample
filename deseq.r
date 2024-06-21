COUNT.filter <- readRDS("COUNT.filter.rds")
phenotype.modified <- readRDS("phenotype.modified.rds")
library(DESeq2)
ddsimp <- DESeqDataSetFromMatrix(countData = COUNT.filter,
                                 colData = phenotype.modified,
                                 design = ~ tissue+batch+ageCat+diag_method+race)
dds <- DESeq(ddsimp)
saveRDS(dds,"dds.rds")
res <- results(dds)
res_df <- as.data.frame(res)
rownames(res_df) <- rownames(COUNT.filter)
saveRDS(res_df,"res_df.rds")