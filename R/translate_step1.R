
# Translates nucleotide to protein using a standard codon table
# Translates in forward frame 1 only
# Expects a single dna sequence as a string
# Returns a single aa sequence as a string
translate1 <- function(dna,codondict){

  start_positions <- seq(1,nchar(dna),by=3)
  codons <- substring(dna,start_positions,start_positions+2)
  
  aa_seq <- c()
  for (c in codons){
    aa <- codondict[c]
    aa_seq <- c(aa_seq,aa)
  }
  paste(aa_seq,collapse = "")
}


# Expects a data frame where the first column is the name and second is the sequence
#
translate_df1 <- function(dna_data){
  codontable <- read_tsv("data/genetic_code.tsv",col_types = cols())
  codondict <- codontable$AA; names(codondict) <- codontable$Codon
  
  result <- data.frame(name=c(),seq=c())

  for(i in 1:nrow(dna_data)){

    row <- data.frame(name=dna_data$seq_name[i], 
                      seq=translate1(dna_data$seq_aa[i],codondict))

    result <- rbind(result,row)  
  }
  result
}