library(tidyverse)

source("R/RaceID3_StemID2_class.R")

cp
load(file.path("data", "20180711-sc-with-dimRed-wo-microglia-CP-RaceID3.Robj"))

up_genes <- read.csv(file.path("data", "20180712_CP_dimRed_up_genes.csv"))

up_genes2 <- up_genes %>%
  filter(padj<.05) %>%
  distinct(Cluster, GENEID, .keep_all= T) 

up_genes2[,-c(1:2)] %>% 
  filter(Cluster %in% c(4, 8, 10, 11, 14)) %>%
  mutate(Cluster = str_replace_all(.$Cluster, c("10" = "hcpMF1", "8" ="hcpMF2", "14" = "hcpMF3", "4" = "dacpMF1", "11" = "dacpMF2"))) %>%
  write.csv(file.path("data", "marker_genes_hcpMF_dacpMF.csv"))

