{
        ++line;
        if (line == 1) {
                # header line
                for (i = 1; i <= NF; ++i) {
                        header[i] = $i;
                        if (i > 1)
                                printf("\t");
                        printf("%s", $i);
                }
                printf("\tbest_tax\tbest_tax_conf\tbest_tax_lvl\n");
        } else {
                # data line
                best_taxlvl = $1;
                best_taxidp = "";
                for (i = ID_start; i < NF - 1; i++) {
                        taxlvl = $i;
                        ++i;
                        taxidp = $i
                        if (taxlvl != "NULL" && taxidp >= taxidpcut) {
                                best_taxlvl = taxlvl;
                                best_taxidp = taxidp;
                                best_taxfld = i - 1;
                        }
                }
                for (i = 1; i <= NF; ++i) {
                        if (i != 1) {
                                printf("\t");
                        }
                        printf("%s", $i);
                }
                printf("\t%s\t%.2f\t%s\n", best_taxlvl, best_taxidp, header[best_taxfld]);
        }
}
