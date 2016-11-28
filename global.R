
PROD  = FALSE
LOCAL = FALSE

Sys.setenv('TZ' = "Europe/Paris")

varglobal = list()
views     = list()

varglobal$chemins$base      = file.path(getwd())
varglobal$chemins$datas     = file.path(varglobal$chemins$base, "Datas")
varglobal$chemins$global    = file.path(varglobal$chemins$base, "Global")
varglobal$chemins$views     = file.path(varglobal$chemins$base, "Views")
varglobal$chemins$modules   = file.path(varglobal$chemins$base, "Modules")
varglobal$chemins$drafts    = file.path(varglobal$chemins$base, "Drafts")
varglobal$chemins$server    = file.path(varglobal$chemins$base, "Server")
varglobal$chemins$www       = file.path(varglobal$chemins$base, "www")
varglobal$chemins$fonctions = file.path(varglobal$chemins$base, "Fonctions")


source(file.path(varglobal$chemins$global, "00_Init.R"))



