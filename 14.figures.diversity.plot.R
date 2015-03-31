library(ggplot2)

cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

pdf("14.figures.diversity.pdf");

insh <- read.table("14.figures.shannon.reshaped.dat", sep='\t', quote='', comment.char='', header=F);
names(insh) <- c("Weeks", "Shannon", "stdev");
ggplot(insh, aes(x=Weeks, y=Shannon)) +
        geom_errorbar(aes(ymin=Shannon-stdev, ymax=Shannon+stdev), width=.1, size = 1) +
        theme_bw() + theme(legend.position = "none") +
	geom_point(aes(size=2)) + geom_line(size=1) + ylim(0, 3.2) +
	scale_colour_manual(values=cbPalette)

dev.off();
