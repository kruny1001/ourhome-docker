# Report Histogram  
library("data.table")
DT = data.table(type=character(), amaze=numeric(0), good=numeric(0), ok=numeric(0),
                bad=numeric(0), horrible=numeric(0))
DT = rbind(DT, list(type="lunch", amaze=32, good=12, ok=20, bad=12, horrible=7))
DT = rbind(DT, list(type="lunch", amaze=22, good=2, ok=10, bad=32, horrible=27))
DT

# Draw Bargraph
barplot(height=as.matrix(DT[1,-1]), main="Score Histograms")
barplot(height=as.matrix(DT[2,-1]), main="Score Histograms")
