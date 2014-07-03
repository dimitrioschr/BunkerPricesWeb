load('bunkerindex.table.new')
load('bunkerportsnews.table.new')
load('marine.news.table.new')
load('navigatemag.table.new')
load('shipandbunker.table.new')

load('port_directory.table')

###########################################################################

bunkerindex.table.new.lookup = list()
length(bunkerindex.table.new.lookup) = 
  length(bunkerindex.table.new$port)

for (i in 1:length(bunkerindex.table.new$port)) {
  lookup.value = which(port_directory.table$port == bunkerindex.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    bunkerindex.table.new.lookup[[i]] = lookup.value
  } else {
    bunkerindex.table.new.lookup[[i]] = NA
  }
}

bunkerindex.table.new.lookup

which(sapply(bunkerindex.table.new.lookup, length) > 1)
which(sapply(bunkerindex.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)


###########################################################################

bunkerportsnews.table.new = 
  bunkerportsnews.table.new[bunkerportsnews.table.new$has.prices == TRUE, ]


bunkerportsnews.table.new.lookup = list()
length(bunkerportsnews.table.new.lookup) = 
  length(bunkerportsnews.table.new$port)

for (i in 1:length(bunkerportsnews.table.new$port)) {
  lookup.value = which(port_directory.table$port == bunkerportsnews.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    bunkerportsnews.table.new.lookup[[i]] = lookup.value
  } else {
    bunkerportsnews.table.new.lookup[[i]] = NA
  }
}

bunkerportsnews.table.new.lookup

which(sapply(bunkerportsnews.table.new.lookup, length) > 1)
which(sapply(bunkerportsnews.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)


###########################################################################

navigatemag.table.new.lookup = list()
length(navigatemag.table.new.lookup) = 
  length(navigatemag.table.new$port)

for (i in 1:length(navigatemag.table.new$port)) {
  lookup.value = which(port_directory.table$port == navigatemag.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    navigatemag.table.new.lookup[[i]] = lookup.value
  } else {
    navigatemag.table.new.lookup[[i]] = NA
  }
}

navigatemag.table.new.lookup

which(sapply(navigatemag.table.new.lookup, length) > 1)
which(sapply(navigatemag.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)


###########################################################################

marine.news.table.new.lookup = list()
length(marine.news.table.new.lookup) = 
  length(marine.news.table.new$port)

for (i in 1:length(marine.news.table.new$port)) {
  lookup.value = which(port_directory.table$port == marine.news.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    marine.news.table.new.lookup[[i]] = lookup.value
  } else {
    marine.news.table.new.lookup[[i]] = NA
  }
}

marine.news.table.new.lookup

which(sapply(marine.news.table.new.lookup, length) > 1)
which(sapply(marine.news.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)


###########################################################################

shipandbunker.table.new.lookup = list()
length(shipandbunker.table.new.lookup) = 
  length(shipandbunker.table.new$port)

for (i in 1:length(shipandbunker.table.new$port)) {
  lookup.value = which(port_directory.table$port == shipandbunker.table.new$port[i])
  if (!(length(lookup.value) == 0)) {
    shipandbunker.table.new.lookup[[i]] = lookup.value
  } else {
    shipandbunker.table.new.lookup[[i]] = NA
  }
}

shipandbunker.table.new.lookup

which(sapply(shipandbunker.table.new.lookup, length) > 1)
which(sapply(shipandbunker.table.new.lookup, 
             function(x) {ifelse(length(x) == 1, 
                                 yes = ifelse(is.na(x), yes = TRUE, no = FALSE), 
                                 no = FALSE)}) == 1)


###########################################################################
