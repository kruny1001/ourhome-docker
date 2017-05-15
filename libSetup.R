list.of.packages <- c("data.table", "httr", "jsonlite","gplots", "ggplot2", "rmarkdown")

#Install Require packages
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

#Load Packages
lapply(list.of.packages, require, character.only = TRUE)
