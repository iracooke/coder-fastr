
# Translates nucleotide to protein using a standard codon table
# Translates in forward frame 1 only
# Expects a single dna sequence as a string
# Returns a single aa sequence as a string
translate0 <- function(dna){

  start_positions <- seq(1,nchar(dna),by=3)
  codons <- substring(dna,start_positions,start_positions+2)
  
  aa_seq <- c()
  for (c in codons){
    codontable <- read_tsv("data/genetic_code.tsv",col_types = cols())
    codondict <- codontable$AA; names(codondict) <- codontable$Codon
    aa <- codondict[c]
    aa_seq <- c(aa_seq,aa)
  }
  paste(aa_seq,collapse = "")
}


# Expects a data frame where the first column is the name and second is the sequence
#
translate_df0 <- function(dna_data){
  result <- data.frame(name=c(),seq=c())
  
  for(i in 1:nrow(dna_data)){

    row <- data.frame(name=dna_data$seq_name[i], 
                      seq=translate0(dna_data$seq_aa[i]))

    result <- rbind(result,row)  
  }
  result
}