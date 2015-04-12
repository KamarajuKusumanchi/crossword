cw <- read.csv('../database/cross_word_database.tsv', header=F, sep="\t", quote="");
dim(cw);
head_cw <- head(cw, 20);

# If a line in the input data file is
# str1<tab>str2
# but the file has 4 fields in general
# then the result is printed as
# str1<tab>str2<tab><tab><tab>
# if keep_trailing_tabs is T. If it is set to F, then the empty fields at the end
# are automatically pruned and the line will be printed as
# str1<tab>str2
# instead.
keep_trailing_tabs=F;
if (keep_trailing_tabs)
{
  write.table(cw, '../database/new.tsv', sep="\t", row.names=F, col.names=F, quote=F);
} else {
  lines <- apply(cw, 1, paste, collapse="\t");
  lines <- gsub("\t*$", "", lines);
  write.table(lines, "../database/new.tsv", sep="\t", row.names=F, col.names=F, quote=F);
}
