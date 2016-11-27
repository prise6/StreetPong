
if(isTRUE(PROD)){
  
  joueurs   = s3readRDS("moulinsart", "joueurs.RDS")
  matchs    = s3readRDS("moulinsart", "matchs.RDS")
  scores    = s3readRDS("moulinsart", "scores.RDS")
  tournois  = s3readRDS("moulinsart", "tournois.RDS")
  
} else {
  
  if(isTRUE(LOCAL)){
    
    joueurs   = readRDS(file.path(varglobal$chemins$datas, "joueurs.RDS"))
    matchs    = readRDS(file.path(varglobal$chemins$datas, "matchs.RDS"))
    scores    = readRDS(file.path(varglobal$chemins$datas, "scores.RDS"))
    tournois  = readRDS(file.path(varglobal$chemins$datas, "tournois.RDS"))
    
  } else {
    
    joueurs   = s3readRDS("moulinsart", "dev_joueurs.RDS")
    matchs    = s3readRDS("moulinsart", "dev_matchs.RDS")
    scores    = s3readRDS("moulinsart", "dev_scores.RDS")
    tournois  = s3readRDS("moulinsart", "dev_tournois.RDS")
    
  }
}
