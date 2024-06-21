library(biomaRt)
top_feature <- read.csv("top_features.txt",header = FALSE, sep = "\n")
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
ensembl.ids <- top_feature$V1
ensembl.ids <- sub("\\..*", "", ensembl.ids)
gene.names <- getBM(attributes = c("ensembl_gene_id", "external_gene_name"),
                    filters = "ensembl_gene_id",
                    values = ensembl.ids,
                    mart = ensembl)

#write.csv(ensembl.ids, file="top_features_gene.txt", row.names = F, quote = F)