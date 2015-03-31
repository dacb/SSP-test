{
	if (line == 0) {
		for (i = 1; i <= NF; ++i) {
			header[i] = $i;
			if ($i == "best_tax")
				max_i = i;
		}
	} else {
#		keep[line] = 0;
		otu[line] = $max_i;
		for (i = 1; i < max_i; ++i) {
#			if ($i > min_percent)
#				keep[line] = 1;
			data[header[i], $max_i] = $i;
		}
	}
	++line;
}
END {
	printf("sample");
	for (l = 1; l < line; ++l) {
		printf("\t%s", otu[l]);
	}
	printf("\n");
	for (i = 1; i < max_i; ++i) {
		printf("%s", header[i]);
		for (l = 1; l < line; ++l) {
			printf("\t%.4f", data[header[i], otu[l]]);
		}
		printf("\n");
	}
}
