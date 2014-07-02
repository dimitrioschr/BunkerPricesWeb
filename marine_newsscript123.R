library(XML)

checker = readLines('http://marine-news.net/bunkers')

bunkers.table = readHTMLTable(checker, header=TRUE, which=18,stringsAsFactors=F)
bunkers.table

bunkers.vector = (bunkers.table[3:dim(bunkers.table)[1], 1])
bunkers.vector

dim(bunkers.vector) = c(5, length(bunkers.vector)/5)
bunkers.vector = t(bunkers.vector)

bunkers = as.data.frame(bunkers.vector)
class(bunkers[, 1])

for (i in 2:5) {
  bunkers[, i] = as.numeric(as.character(bunkers[, i]))
}
