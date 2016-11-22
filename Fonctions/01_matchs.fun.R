

validerMatch = function(joueur1, joueur2, nbrSet1, nbrSet2, date) {
  
  print(joueur1)
  print(joueur2)
  print(nbrSet1)
  print(nbrSet2)
  print(date)
  
  if(joueur1 != joueur2){
    if(nbrSet1 %in% 0:2 && nbrSet2 %in% 0:2 && nbrSet1 != nbrSet2){
      if(nbrSet1 == 2 || nbrSet2 == 2){
        if(isTRUE(is.Date(date))){
          return(TRUE)
        } else { print("date") }
      } else { print("set2")  }
    } else { print("set") }
  } else { print("joueur") }
  return(FALSE)
}

ajouterMatch = function(matchs, date, commentaires) {
  nv_id = ifelse(nrow(matchs) == 0, 1, matchs[, max(id)+1])
  
  matchs = rbind(
    use.names = F,
    matchs,
    data.table(
      nv_id,
      date,
      commentaires
    )
  )
  
  
  return(list("matchs" = matchs, "nv_id" = nv_id))
}

ajouterScore = function(scores, id_joueur, id_match, victoire, nbr_sets) {
  
  scores = rbind(
    use.names = F,
    scores,
    data.table(
      id_joueur,
      id_match,
      victoire,
      nbr_sets
    )
  )
  
  
  return(scores)
}

nombrePoints = function(victoires, nbr_sets){
  nbr_sets = ifelse(nbr_sets == 0, 2, nbr_sets)
  return(sum((victoires*2-1)*nbr_sets))
}
