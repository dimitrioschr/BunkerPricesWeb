library(XML)

page1 = 'http://www.bunkerindex.com/prices/africa.php'
page2 = 'http://www.bunkerindex.com/prices/asia.php'
page3 = 'http://www.bunkerindex.com/prices/lamerica.php'
page4 = 'http://www.bunkerindex.com/prices/meast.php'
page5 = 'http://www.bunkerindex.com/prices/namerica.php'
page6 = 'http://www.bunkerindex.com/prices/neurope.php'
page7 = 'http://www.bunkerindex.com/prices/seurope.php'


bunkers.table = readHTMLTable(page1, header=T,stringsAsFactors=F)
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]
bunkers.table[[10]]

bunkers.table = readHTMLTable(page2, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]

bunkers.table = readHTMLTable(page3, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]

bunkers.table = readHTMLTable(page4, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]

bunkers.table = readHTMLTable(page5, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]

bunkers.table = readHTMLTable(page6, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]
bunkers.table[[10]]

bunkers.table = readHTMLTable(page7, header=T,stringsAsFactors=F)
bunkers.table[[6]]
bunkers.table[[7]]
bunkers.table[[8]]
bunkers.table[[9]]
bunkers.table[[10]]


