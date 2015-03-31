library(vegan)

md <- read.delim("sample_info.xls", header=T, row.names=1, sep='\t');
head(md)

d <- read.delim("12.persistent_otus.xls", header=T, row.names=1, sep="\t")

cols <- row.names(md)
raw_otus <- d[, cols]

sample_read_sums <- read.table("13.summarize_persistent_otus.all.read_sum.xls", header=T, sep="\t")
sample_read_sums
dim(sample_read_sums)

# normalize the otu maxtrix by the maximum number of reads
max_seqs <- max(sample_read_sums)
otus <- scale(raw_otus, center=FALSE, scale=t(sample_read_sums))
otus <- otus * max_seqs
colSums(otus)
head(otus)
sample_otus <- t(otus)
head(sample_otus)

sample_full <- data.frame(sample_otus, lane = md$lane)

mds <- metaMDS(sample_otus, maxit=1000, trymax=100)
mds

mds$points
pdf("14.figures.MDS.pdf");
plot(mds$points, type = "n", xlim=c(-.3, .7), ylim=c(-.5, .5))
points(mds$points, cex = 1.0, pch=21, col="black", bg="red")
text(x, y, labels = md$samples)
dev.off()
