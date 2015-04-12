print_data <- function(ifname, ofname, keep_trailing_tabs)
{
  cw <- read.csv(ifname, header=F, sep="\t", quote="");
  
  # The keep_trailing_tabs flag controls how empty fields at the end of a line
  # are handled.
  #
  # For example, if a line in the input data file is
  #     str1<tab>str2
  # but the file has 4 fields in general
  # then the result is printed as
  #     str1<tab>str2<tab><tab><tab>
  # if keep_trailing_tabs is T. If it is set to F, then the empty fields at the end
  # are automatically pruned and instead the line will be printed as
  #     str1<tab>str2
  if (keep_trailing_tabs)
  {
    write.table(cw, ofname, sep="\t", row.names=F, col.names=F, quote=F);
  } else {
    lines <- apply(cw, 1, paste, collapse="\t");
    lines <- gsub("\t*$", "", lines);
    write.table(lines, ofname, sep="\t", row.names=F, col.names=F, quote=F);
  }
  
  return(cw);
}

# cw <- print_data(ifname='../database/cross_word_database.tsv', 
#                  ofname="../database/new.tsv", 
#                  keep_trailing_tabs=T);
# cw <- print_data(ifname='../database/new.tsv', 
#                  ofname="../database/new2.tsv", 
#                  keep_trailing_tabs=T);
cw <- print_data(ifname='../database/cross_word_database.tsv', 
                 ofname="../database/cross_word_database.tsv", 
                 keep_trailing_tabs=T);
dim(cw);
head_cw <- head(cw, 20);
