source("heatmap.3.R")
library(vegan)
library(RColorBrewer)
library(ggplot2)

md <- read.delim("sample_info.xls", header=T, row.names=1, sep='\t');
head(md)

d <- read.table("SSP.xls", header=T, row.names=1, sep="\t")

cols <- row.names(md)
raw_otus <- d[, cols]
head(raw_otus)

otus.t <- t(raw_otus)

otus.diversity <- diversity(otus.t, index="shannon")
head(otus.diversity)
head(names(otus.diversity))
#names(otus.diversity) <- as.character(md[names(otus.diversity), "ShortName"])
write.table(otus.diversity, file="14.figures.shannon.dat", sep='\t', quote=F, col.names=F)
