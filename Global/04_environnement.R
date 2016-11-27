
varglobal$labels$selectMatchJoueur1NbrSet = varglobal$labels$selectMatchJoueur2NbrSet = "Sets"
varglobal$labels$selectMatchJoueur1 = varglobal$labels$selectMatchJoueur2 = "Joueur"
varglobal$labels$btnAjouterMatch = "Ajouter le match !"
varglobal$labels$commentaireMatch = "Commentaire"
varglobal$labels$dateMatch = "Date"
varglobal$labels$tournoisMatch = "Tournoi"
varglobal$labels$filtresTournois = "Tournois"
varglobal$labels$filtresSemaines = "Semaines"



varglobal$choices$joueurs = joueurs$id_joueur
names(varglobal$choices$joueurs) = joueurs$pseudo

varglobal$choices$tournois = tournois$id_tournoi
names(varglobal$choices$tournois) = tournois$nom

varglobal$choices$semaines = seq(47, as.integer(format(Sys.Date(), "%V")), by = 1)
