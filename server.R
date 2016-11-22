

server = function(input, output, session) {
  
  datas = reactiveValues(
    matchs = matchs,
    scores = scores
  )
  
  ## Scores
  
  output$IBnbrMatchs = renderInfoBox({
    nbr = datas$matchs[, uniqueN(id)]
    
    infoBox(
      title = "Match joués",
      value = nbr,
      color = "green"
    )
  })
  
  output$dt.classement = DT::renderDataTable({
    print(datas$scores)
    
    dt = merge(joueurs, datas$scores, by.x = "id", by.y = "id_joueur")
    # dt = data.table:::merge.data.table(joueurs, scores, by.x = "id", by.y = "id_joueur")
    datatable(dt[, list(
      `Nombre de victoire` = sum(victoire),
      `Nombre de defaite`  = sum(1-victoire),
      `Nombre de matchs`   = length(victoire),
      `Points`             = nombrePoints(victoire, nbr_sets)
    ), by = pseudo][order(-Points)])
  })
  
  ## Nouveau Match
  
  selectionMatchJoueur1 = reactive({
    as.integer(input$selectMatchJoueur1)
  })
  
  selectionMatchJoueur2 = reactive({
    as.integer(input$selectMatchJoueur2)
  })
  
  selectionMatchJoueur1NbrSet = reactive({
    as.integer(input$selectMatchJoueur1NbrSet)
  })
  
  selectionMatchJoueur2NbrSet = reactive({
    as.integer(input$selectMatchJoueur2NbrSet)
  })
  
  selectionMatchCommentaires = reactive({
    input$textMatchCommentaires
  })
  
  selectionMatchDate = reactive({
    as.Date(input$dateMatchDate, format = "%Y-%m-%d")
  })
  
  validationFormMatch = eventReactive(input$btnAjouterMatch, {
    if(isTRUE(validerMatch(
      selectionMatchJoueur1(),
      selectionMatchJoueur2(),
      selectionMatchJoueur1NbrSet(),
      selectionMatchJoueur2NbrSet(),
      selectionMatchDate()
    ))){
      
      print("Valide matchs")
      
      print(head(datas$matchs))
      
      res = ajouterMatch(
        datas$matchs,
        selectionMatchDate(),
        selectionMatchCommentaires()
      )
      
      scores  = ajouterScore(datas$scores, selectionMatchJoueur1(), res$nv_id, selectionMatchJoueur1NbrSet() == 2, selectionMatchJoueur1NbrSet())
      scores  = ajouterScore(scores, selectionMatchJoueur2(), res$nv_id, selectionMatchJoueur2NbrSet() == 2, selectionMatchJoueur2NbrSet())
      
      datas$matchs = res$matchs
      datas$scores = scores
      
      saveRDS(datas$matchs, file.path(varglobal$chemins$datas, "matchs.RDS"))
      saveRDS(datas$scores, file.path(varglobal$chemins$datas, "scores.RDS"))
      
      return(TRUE)
    }
    
    return(FALSE)
  })
  
  output$ajouterMatchUI = renderUI({
    if(isTRUE(validationFormMatch())){
      return(tagList(
        div(
          class = "alert alert-success",
          strong("Le match a bien été ajouté!")
        )
      ))
    }
    
    return(tagList(
      div(
        class = "alert alert-warning",
        strong("Mal rempli!")
      )
    ))
  })
  
}