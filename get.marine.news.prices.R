get.marine.news.prices = function() {
  
  library(XML)
  

  checker = readLines('http://marine-news.net/bunkers')
  bunkers.table = readHTMLTable(checker, header=TRUE, which=18,stringsAsFactors=F)
  bunkers.vector = (bunkers.table[3:dim(bunkers.table)[1], 1])
  
  dim(bunkers.vector) = c(5, length(bunkers.vector)/5)
  bunkers.vector = t(bunkers.vector)
  
  bunkers = as.data.frame(bunkers.vector)
  
  for (i in 2:5) {
    bunkers[, i] = as.numeric(as.character(bunkers[, i]))
  }
  
  names(bunkers) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO')
  bunkers$port = as.character(bunkers$port)
  
  return(bunkers)
  
}