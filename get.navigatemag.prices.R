get.navigatemag.prices = function() {
    
  library(stringr)
  
  results.data.frame = as.data.frame(matrix(nrow=1, ncol=7))
  results.data.frame[, ] = as.numeric(results.data.frame[, ])
  results.data.frame[, 1] =as.character(results.data.frame[, 1])
  results.data.frame[, 6] =as.logical(results.data.frame[, 6])
  results.data.frame[, 7] =as.character(results.data.frame[, 1])
  names(results.data.frame) = c('port', 'IFO380', 'IFO180', 
                                'MDO', 'MGO', 'all.na', 'region')
  
  for (i in 0:5) {
    
    page = paste0('http://navigatemag.ru/bunker/', i)
    text = readLines(page)
    region = text[which(str_detect(text, 'bgcolor=#C2C8D1>'))]
    region = unlist(str_split(
      unlist(str_split(region, 'bgcolor=#C2C8D1>'))[2], 
      '<'))[1]
    table = text[which(str_detect(text, 'Last update:'))]
    table = unlist(str_split(table, 'class=bunav><td>'))
    update = str_replace(unlist(str_split(table[1], '>'))[6], '</td', '')
    
    
    for (j in 3:length(table)) {
      
      port.entry = str_replace_all(unlist(str_split(table[j], 'td>')), '</', '')
      port = port.entry[1]
      port = str_replace_all(port, "[.',]", "")
      IFO180 = as.numeric(unlist(str_split(port.entry[5], '&nbsp'))[1])
      IFO380 = as.numeric(unlist(str_split(port.entry[9], '&nbsp'))[1])
      MGO = as.numeric(unlist(str_split(port.entry[13], '&nbsp'))[1])
      MDO = as.numeric(unlist(str_split(port.entry[17], '&nbsp'))[1])
      all.na = is.na(IFO180) & is.na(IFO380) & is.na(MGO) & is.na(MDO)
      row.to.bind = data.frame(port, IFO380, IFO180, MDO, MGO, all.na, region)
      results.data.frame = rbind(results.data.frame, row.to.bind)
      
    }
    
  }
  
  results.data.frame = results.data.frame[
    which(results.data.frame$all.na == FALSE), c(1:5, 7)]
  
  results.data.frame = results.data.frame[, -6]
  
  to.add = matrix(nrow = dim(results.data.frame)[1], ncol = 4)
  to.add = as.data.frame(to.add)
  results.data.frame = cbind(results.data.frame, to.add)
  for (i in 6:9) {
    results.data.frame[, i] = as.numeric(results.data.frame[, i])
  }
  
  names(results.data.frame) = c('port', 'IFO380', 'IFO180', 'MDO', 'MGO',
                                'LS380', 'LS180', 'LSMDO', 'LSMGO')
  
  results.data.frame$port = as.character(results.data.frame$port)
  
  
  return(results.data.frame)
  
}