

server = function(input, output, session) {
  
  ## Reactive values
  
  datas = reactiveValues(
    matchs   = unique(myReadRDS("matchs.RDS", varglobal, PROD, LOCAL), by = "id_match"),
    scores   = unique(myReadRDS("scores.RDS", varglobal, PROD, LOCAL), by = NULL),
    tournois = myReadRDS("tournois.RDS", varglobal, PROD, LOCAL)
  )
  
  varsession = reactiveValues(
    semaines = seq(47, as.integer(format(Sys.Date(), "%V")), by = 1)
  )
  
  ## sidebar
  
  output$sliderSemaines = renderUI({
    sliderInput(
      inputId = "selectSemaines",
      label   = varglobal$labels$filtresSemaines,
      min     = min(varsession$semaines),
      max     = max(varsession$semaines),
      value   = c(min(varsession$semaines), max(varsession$semaines)),
      step    = 1,
      ticks   =  F
    )
  })
  
  ## data getters 
  
  getMatchs = reactive({
    datas$matchs[id_tournoi %in% selectTournoi() & as.integer(format(date, "%V")) %in% selectSemaines()]
  })
  
  getScores = reactive({
    datas$scores
  })
  
  getTournois = reactive({
    datas$tournois
  })
  
  getJoueurs = reactive({
    joueurs
  })
  
  getMergeDatas = reactive({
    dt = merge(getMatchs(), getScores(), by = "id_match")
    dt = merge(getJoueurs(), dt, by = "id_joueur")
    dt
  })
  
  getClassement = reactive({
    getMergeDatas()[, list(
      `Pts` = nombrePoints(victoire, nbr_sets),
      `V`   = sum(victoire),
      `D`   = sum(1-victoire),
      `M`   = length(victoire)
    ), by = pseudo][order(-Pts)]
  })
  
  ## Filtres
  
  selectTournoi = reactive({
    if(input$selectTournoi == 1)
      getTournois()[, unique(id_tournoi)]
    else
      input$selectTournoi
  })
  
  selectSemaines = reactive({
    input$selectSemaines
  })
  
  ## Scores
  
  output$IBnbrMatchs = renderInfoBox({
    nbr = getMatchs()[, uniqueN(id_match)]
    
    infoBox(
      title = "Match joués",
      value = nbr,
      icon  = shiny::icon("bar-chart"),
      color = "green"
    )
  })
  
  output$IBnbrJoueurs = renderInfoBox({
    nbr = getMergeDatas()[, uniqueN(id_joueur)]
    
    infoBox(
      title = "Joueurs",
      value = nbr,
      icon  = shiny::icon("users"),
      color = "red"
    )
  })
  
  
  output$IBjoueursPremier = renderInfoBox({
    
    pseudo = getClassement()[1, pseudo]
    
    infoBox(
      title = "Leader",
      value = pseudo,
      icon  = shiny::icon("child"),
      color = "blue"
    )
    
  })
  
  output$dt.classement = DT::renderDataTable({
    datatable(getClassement(), rownames = F, filter = "none", extensions = "Responsive")
  })
  
  output$dt.matchs = DT::renderDataTable({
    dt = getMergeDatas()
    dt = merge(dt, getTournois()[, list(nom_tournoi = nom, id_tournoi)], by = "id_tournoi")
    datatable(dt[, list(
      J1          = pseudo[1],
      score       = paste(nbr_sets[1], nbr_sets[2], sep = "-"),
      J2          = pseudo[2],
      date        = date[1],
      commentaire = commentaire[1],
      tournoi     = nom_tournoi[1]
    ), by = "id_match"][order(-date)][, id_match := NULL],
    rownames   = F,
    filter     = "none",
    extensions = "Responsive",
    options = list(
      columnDefs = list(
        list(className = "dt-center", targets = 1),
        list(className = "dt-right", targets = 0),
        list(className = "dt-left", targets = 2)
      )
    ))
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
  
  selectionMatchTournois = reactive({
    tournoi = as.integer(input$selectMatchTournois)
    if(tournoi %in% getTournois()$id_tournoi & tournoi > 1)
      tournoi
    else 
      NULL
  })
  
  selectionMatchCommentaires = reactive({
    input$textMatchCommentaires
  })
  
  selectionMatchDate = reactive({
    as.Date(input$dateMatchDate, format = "%Y-%m-%d", tz = "Europe/Paris")
  })
  
  validationFormMatch = eventReactive(input$btnAjouterMatch, {
    if(isTRUE(validerMatch(
      selectionMatchJoueur1(),
      selectionMatchJoueur2(),
      selectionMatchJoueur1NbrSet(),
      selectionMatchJoueur2NbrSet(),
      selectionMatchTournois(),
      selectionMatchDate()
    ))){
      
      res = ajouterMatch(
        getMatchs(),
        selectionMatchDate(),
        selectionMatchCommentaires(),
        selectionMatchTournois()
      )
      
      scores  = ajouterScore(getScores(), selectionMatchJoueur1(), res$nv_id, selectionMatchJoueur1NbrSet() == 2, selectionMatchJoueur1NbrSet())
      scores  = ajouterScore(scores, selectionMatchJoueur2(), res$nv_id, selectionMatchJoueur2NbrSet() == 2, selectionMatchJoueur2NbrSet())
      
      datas$matchs = res$matchs
      datas$scores = scores
      
      mySaveRDS(datas$matchs, "matchs.RDS", varglobal, PROD, LOCAL)
      mySaveRDS(datas$scores, "scores.RDS", varglobal, PROD, LOCAL)
      
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