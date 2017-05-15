library(data.table)
library(httr)
library(jsonlite)
library(rmarkdown)
## Weekly report 

weeklyReport <- function (){
  saveRDS(corTable,file="tables/weeklyReport.Rda")
}

readFirebase <- function(){
  # Example 
  readData <- GET("https://ourhome-e909b.firebaseio.com/scores.json")
  dd <- content(readData, "text")
  return(jsonlite::fromJSON(dd))
}

result = readFirebase()
dataEx <- data.frame(date=character(), type=factor(), 
                     amaze=numeric(0), good=numeric(0), ok=numeric(0), 
                     bad = numeric(0), horrible = numeric(0)
                     , stringsAsFactors=T)

for (date in names(result)){
  target = result[[date]]
  if(!is.null(target$dinner)){
    dataEx <- rbind(
      dataEx, 
      data.frame(
        date=date, 
        type="dinner",
        amaze= ifelse(is.null(target$dinner$amaze),0,target$dinner$amaze),
        good = ifelse(is.null(target$dinner$good),0,target$dinner$good),
        ok = ifelse(is.null(target$dinner$ok),0,target$dinner$ok),
        bad = ifelse(is.null(target$dinner$bad),0,target$dinner$bad),
        horrible = ifelse(is.null(target$dinner$horrible),0,target$dinner$horrible)
      )
    )  
  }
  
  if(!is.null(target$lunch)){
    dataEx <- rbind(
      dataEx, 
      data.frame(
        date=date, 
        type="lunch",
        amaze= ifelse(is.null(target$lunch$amaze),0,target$lunch$amaze),
        good = ifelse(is.null(target$lunch$good),0,target$lunch$good),
        ok = ifelse(is.null(target$lunch$ok),0,target$lunch$ok),
        bad = ifelse(is.null(target$lunch$bad),0,target$lunch$bad),
        horrible = ifelse(is.null(target$lunch$horrible),0,target$lunch$horrible)
      )
    )  
  }
  
  if(!is.null(target$late)){
    dataEx <- rbind(
      dataEx, 
      data.frame(
        date=date, 
        type="late",
        amaze= ifelse(is.null(target$late$amaze),0,target$late$amaze),
        good = ifelse(is.null(target$late$good),0,target$late$good),
        ok = ifelse(is.null(target$late$ok),0,target$late$ok),
        bad = ifelse(is.null(target$late$bad),0,target$late$bad),
        horrible = ifelse(is.null(target$late$horrible),0,target$late$horrible)
      )
    )  
  }
}


saveRDS(dataEx,file="tables/weekly.Rda")
svg('./result/weeklyBar.svg', width=10, height=10)
par(mfrow=c(3,3))
for (idx in 1:nrow(dataEx)){
  barData = as.matrix(dataEx[idx,3:7])
  barplot(barData, main="Bar Graph")
}
dev.off()
