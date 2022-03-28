rm(list = ls())#一键清空
#安装并加载R包
if(length(getOption("CRAN"))==0) options(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/")
if(!require("rtracklayer")) BiocManager::install("rtracklayer")
if(!require("tidyr")) BiocManager::install("tidyr")
if(!require("dplyr")) BiocManager::install("dplyr")
if(!require("DESeq2")) BiocManager::install("DESeq2")
if(!require("limma")) BiocManager::install("limma")
if(!require("pheatmap")) BiocManager::install("pheatmap")
if(!require("org.Hs.eg.db")) BiocManager::install("org.Hs.eg.db")
if(!require("clusterProfiler")) BiocManager::install("clusterProfiler")

library(limma)
library(edgeR)
library(dplyr)
a <- read.delim2("combined_RNA_Expr.txt", row.names = 1)
dim(a)
a[0:4,1:4]

#####gene id 转换
gtf <- rtracklayer::import('Homo_sapiens.GRCh38.105.chr.gtf.gz')
#转化为数据框
gtf <- as.data.frame(gtf)
#查看文件，保存文件为Rdata，将来方便我们直接打开
dim(gtf)
#save(gtf,file = "Homo_sapiens.GRCh38.105基因组注释文件.Rda")
colnames(counts[1]) <- 'gene_id'
a=dplyr::filter(gtf,type=="gene",gene_biotype=="protein_coding")
dim(a)
#只选择gene_name，gene_id和gene_biotype这三列








