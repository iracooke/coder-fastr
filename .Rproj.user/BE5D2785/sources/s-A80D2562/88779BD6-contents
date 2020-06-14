library(profvis)
library(ampir)
library(tidyverse)


dna_in <- read_faa("data/dna.fasta")


source("R/translate_step0.R")
profvis({
  translate_df0(dna_in)
})



source("R/translate_step1.R")
profvis({
  translate_df1(dna_in)
})


source("R/translate_step2.R")

profvis({
  translate_df2(dna_in)
})

system.time(translate_df1(dna_in))
system.time(translate_df2(dna_in))

big_dna_in <- read_faa("data/big_dna.fasta")

profvis({
  translate_df3(big_dna_in)
})

source("R/translate_step3.R")

system.time(translate_df2(big_dna_in))
system.time(translate_df3(big_dna_in))

# What is our overall performance improvement compared with the first version

system.time(translate_df0(big_dna_in[1:100,]))
system.time(translate_df3(big_dna_in[1:100,]))


