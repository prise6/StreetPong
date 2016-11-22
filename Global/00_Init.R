
invisible(lapply(c(
  file.path(varglobal$chemins$global, "03_Datas.R"),
  file.path(varglobal$chemins$global, "01_Packages.R"),
  file.path(varglobal$chemins$global, "04_environnement.R"),
  list.files(varglobal$chemins$fonctions, pattern = "*.R", full.names = T),
  list.files(file.path(varglobal$chemins$views, "Body"), pattern = "*.R", full.names = T, recursive = F),
  list.files(varglobal$chemins$views, pattern = "*.R", full.names = T, recursive = F),
  list.files(varglobal$chemins$server, pattern = "*.R", full.names = T)
), function(fichier){
  if(length(fichier) > 0 && file.exists(fichier))
    source(fichier)
}))


