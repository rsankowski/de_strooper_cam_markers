library(tidyverse)

source("R/RaceID3_StemID2_class.R")

load("data/20180716_Men_dimRed_wo_micr_sc_RaceID3.Robj")

df <- read.csv(file.path("data", "20180122_Men_updated_cluster_information.csv"))

df$Subpopulation <- str_replace_all(df$Subpopulation, c("mMF2"="damMF1", "moMF"="mMC4", "moDCs"="mMC5", "Mon1"="mMC1", "Mon2"="mMC3", "Mon3"="mMC2","DCs"="mDC1"))
write.csv(df, file.path("data", "metadata_men.csv"))

up_genes <- read.csv(file.path("data", "20180716_Men_up_genes.csv"))
up_genes2 <- up_genes %>%
  filter(padj<.05) %>%
  distinct(Cluster, GENEID, .keep_all= T) 

up_genes2[,-c(1:2)] %>%
  write.csv(file.path("data", "marker_genes_men.csv"))

up_genes2[,-c(1:2)] %>% 
  filter(Cluster %in% c(1, 4)) %>%
  mutate(Cluster = str_replace_all(.$Cluster, c("1" = "hmMF", "4" ="damMF1"))) %>%
  write.csv(file.path("data", "marker_genes_hmMF_da_mMF.csv"))


