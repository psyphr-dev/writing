# Extract PLOS
# Kathleen Wendt
# 20190829


# install.packages("rplos")
## https://github.com/ropensci/rplos
# install.packages("fulltext")
## https://ropenscilabs.github.io/fulltext-book/index.html

library(rplos)
library(fulltext)

# General search with multiple terms

q <- c("mindware","mindware technologies","biopac", "biopac systems, inc.")

full_search <- lapply(q, function(x) searchplos(x))

# MindWare only 

mw_plos <- searchplos(q = "mindware",
                      fl = "id")

# BIOPAC only

bp_plos <- searchplos(q = "biopac",
                      fl = "id")

# Facet by field

facetplos(q = q, 
          facet.field = c('journal','subject'))

# Context of term in abstract / example of web-based interaction with DOIs

(out <- highplos(q='mindware', hl.fl = 'abstract'))
highbrow(out)

# Examine the number of article views for papers with selected terms

plosviews(search = "mindware")

# Visualize word use across articles

# Data collection system

plosword(list("mindware", "mindware technologies",
              "biopac", "biopac systems, inc."), 
         vis = 'TRUE')

# Data stream/measure

plosword(list("heart rate variability", "respiratory sinus arrhythmia",
              "electrodermal activity", "skin conductance",
              ), 
         vis = 'TRUE')
