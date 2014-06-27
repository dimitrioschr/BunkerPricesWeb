library(XML)
library(stringr)

page1 = 'http://www.bunkerindex.com/prices/africa.php'
page2 = 'http://www.bunkerindex.com/prices/asia.php'
page3 = 'http://www.bunkerindex.com/prices/lamerica.php'
page4 = 'http://www.bunkerindex.com/prices/meast.php'
page5 = 'http://www.bunkerindex.com/prices/namerica.php'
page6 = 'http://www.bunkerindex.com/prices/neurope.php'
page7 = 'http://www.bunkerindex.com/prices/seurope.php'

# initialise bunkerindex.table
bunkerindex.table = as.data.frame(matrix(nrow = 0, ncol = 9))

# read - in first page, collate relevant HTMLTables, remove superfluous data, coerce to numeric etc.
bunkers.table = readHTMLTable(page1, header=T,stringsAsFactors=F)
bunkers.table = cbind(bunkers.table[[7]], bunkers.table[[8]], bunkers.table[[9]], bunkers.table[[10]])
table.length = length(bunkers.table)
bunkers.table = bunkers.table[, 1:(table.length - 2)]
names(bunkers.table) = str_replace_all(names(bunkers.table), ' ', '')
names(bunkers.table)[1] = 'port'
table.length = length(bunkers.table)
table.names = names(bunkers.table)
for (i in 2:table.length) {
  if (table.names[i] == 'LS') {
    table.names[i] = str_replace_all(table.names[i - 1], 'IFO', 'LS')
  }
  bunkers.table[, i] = unlist(str_split(bunkers.table[, i], ' '))[1]
  bunkers.table[, i] = as.numeric(bunkers.table[, i])
}

# append the necessary number of port rows
no.ports = dim(bunkers.table)[1]
bunkerindex.table = rbind(bunkerindex.table, matrix(nrow = no.ports, ncol = 9))
names(bunkerindex.table) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
                             'LS380', 'LS180', 'LSMDO', 'LSMGO')

# get the fields for which a name already exists
for (i in 1:no.ports) {
  for (j in 1:table.length) {
    bunkerindex.table[i, table.names[j]] = bunkers.table[i, table.names[j]]
  }
}


add.data.frame = as.data.frame(matrix(nrow = no.ports, ncol = 9))
names(add.data.frame) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO', 
                                  'LS380', 'LS180', 'LSMDO', 'LSMGO')
bunkerindex.table = rbind(bunkerindex.table, add.data.frame)


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


