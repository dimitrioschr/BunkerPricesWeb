load('port_directory.table')
bunkerindex.lookup = create.bunkerindex.lookup()
bunkerportsnews.lookup = create.bunkerportsnews.lookup()
marine.news.lookup = create.marine.news.lookup()
navigatemag.lookup = create.navigatemag.lookup()
shipandbunker.lookup = create.shipandbunker.lookup()

port.indices = unique(c(bunkerindex.lookup$pd.line, 
                        bunkerportsnews.lookup$pd.line, 
                        marine.news.lookup$pd.line, 
                        navigatemag.lookup$pd.line, 
                        shipandbunker.lookup$pd.line))

ports = as.character(port_directory.table$port[port.indices])
port.coordinates = cbind(port_directory.table$longitude[port.indices], 
                         port_directory.table$latitude[port.indices])

library(rworldmap)
library(rworldxtra)
library(maps)

# map(database = 'world', xlim = c(-20, 30), ylim = c(30, 60))
map = getMap(resolution = 'high')
plot(map, xlim = c(-10, 30), ylim = c(50, 60))
points(port.coordinates, pch = 20, cex = 2 , col = 2)

