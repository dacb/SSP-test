{
	if ($1 == "Donor") {
		donor = $2;
		week = "Donor";
	} else if ($1 == "Biopsy") {
		biopsy = $2;
		week = "Biopsy";
	} else {
		week = substr($1, 12, 1);
	}
	reps[week]++;
	data[week, reps[week]] = $2;
}
END {
	for (key in reps) {
		delete d;
		rs = reps[key];
		sum = 0;
		for (i = 1; i <= rs; ++i) {
			d[i] = data[key, i];
			sum += d[i];
		}
		printf("%s\t%.4f\t%.4f\n", key, sum / rs, stdev(d));
	}
}
function stdev(arr,  i,n,s1,s2,variance,x) {
    for (i in arr) {
      n++
      x = arr[i]
      s1 += x ^ 2
      s2 += x
    }
    variance = ((n * s1) - (s2 ^ 2)) / (n ^ 2)
    return(sqrt(variance))
}
