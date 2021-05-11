library(tidyverse)

source("R/RaceID3_StemID2_class.R")

#perivascular space
load("/Users/romansankowski/Documents/single_cell_analysis/EAE_Final/PV/RaceID/20180702-PV-sc-with-dimRed+Men+CP-micr.Robj")

up_genes <- read.csv(file.path("data", "20180720_PV_up_genes.csv"))

up_genes2 <- up_genes %>%
  filter(padj<.05) %>%
  distinct(Cluster, GENEID, .keep_all= T) 

#export pvm
up_genes2[,-c(1:2)] %>% 
  filter(Cluster %in% c(11, 13)) %>%
  mutate(Cluster = str_replace_all(.$Cluster, c("11" = "hpvMF", "13" ="dapvMF1"))) %>%
  write.csv(file.path("data", "marker_genes_hpvMF_dapvMF.csv"))

#export microglia 
up_genes2[,-c(1:2)] %>% 
  filter(Cluster %in% c(1, 2, 5, 9, 12, 19)) %>%
  mutate(Cluster = str_replace_all(.$Cluster, c("^9$" = "hMG1", "^2$" ="hMG2", "^1$" = "daMG1", "12" = "daMG2", "^19$" = "daMG3", "5"="daMG4"))) %>%
  write.csv(file.path("data", "marker_genes_hMG_daMG.csv"))
