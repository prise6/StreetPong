

mySaveRDS = function(datas, file, varglobal, PROD, LOCAL) {
  if(isTRUE(PROD)){
    s3saveRDS(datas, "moulinsart", file)
  } else {
    if(isTRUE(LOCAL)){
      saveRDS(datas$matchs, file.path(varglobal$chemins$datas, paste("dev", file, sep = "_")))
    } else {
      s3saveRDS(datas, "moulinsart", paste("dev", file, sep = "_"))
    }
  }
}

myReadRDS = function(file, varglobal, PROD, LOCAL) {
  if(isTRUE(PROD)){
    s3readRDS("moulinsart", file)
  } else {
    if(isTRUE(LOCAL)) {
      readRDS(file.path(varglobal$chemins$datas, file))
    } else {
      s3readRDS("moulinsart", paste("dev", file, sep = "_"))
    }
  }
}