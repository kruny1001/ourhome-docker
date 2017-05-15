# kevin.R

# Include your code
#source("./partial.R")
library(jsonlite)


###############

#Read Data from firebase
#* @get /fb/data
readFirebase <- function(){
  # Example
  readData <- GET("https://bcloud.firebaseio.com/fromR/names.json")
  dd <- content(readData, "text")
  toJSON(fromJSON(dd))
}


###################################

# list retention data.table
#* @get /train
gmtFiles <- function(){
  firstTest <- DataClass$new(targetCol="Bad", part=.8)
  firstTest$getTest()
}

# Create lift graph
#* @png
#* @get /plot
normalMean <- function(samples=10){
  p <- GainFunction$createCumLiftPlot(gainDecileTable1)
  print(p)
}

#* @get /roc
rocPoints <- function(){
  gainTable1
}

#* @get /lift
liftPoints <- function() {
  gainDecileTable1
}

#* @get /refresh/<id:int>
refresh <- function(id){
if(id == 1)
targetForm = form1
else if(id ==2)
targetForm = form2
else
targetForm = form3

firstTest <- DataClass$new(targetCol="Bad", part=.6)
train <- firstTest$getTrain()
test <- firstTest$getTest()
MARSRef1$createModel(targetForm, deg=1)
model1 <<- MARSRef1$getModel()
tablePred1 <<- MARSRef1$getPredTable()
gainTable1 <<- MARSRef1$getGainTable()
gainDecileTable1 <<- MARSRef1$getGainDecileTable()
gainDecileTable1
}
