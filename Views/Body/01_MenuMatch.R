

views$tabItems$nvMatch = fluidRow(
  column(
    width = 12,
    h1("Nouveau match"),
    uiOutput("ajouterMatchUI")
  ),
  
  column(
    width = 12,
    h3("Scores")
  ),
  
  column(
    width = 3,
    selectInput(
      inputId = "selectMatchJoueur1",
      label = varglobal$labels$selectMatchJoueur1,
      choices = c("", varglobal$choices$joueurs),
      width = "100%"
    )
  ),
  
  column(
    width = 1,
    selectInput(inputId = "selectMatchJoueur1NbrSet", label = varglobal$labels$selectMatchJoueur1NbrSet, choices = 0:2)
  ),
  
  column(
    width = 1,
    div(
      class = "text-center",
      br(),
      "-"
    )
  ),
  
  column(
    width = 1,
    selectInput(inputId = "selectMatchJoueur2NbrSet", label = varglobal$labels$selectMatchJoueur2NbrSet, choices = 0:2)
  ),
  
  column(
    width = 3,
    selectInput(
      inputId = "selectMatchJoueur2",
      label = varglobal$labels$selectMatchJoueur2,
      choices = c("", varglobal$choices$joueurs),
      width = "100%"
    )
  ),
  
  column(
    width = 5,
    textAreaInput(
      inputId = "textMatchCommentaires",
      label = varglobal$labels$commentaireMatch,
      width = "100%"
    )
  ),
  
  column(
    width = 1,
    dateInput(
      inputId = "dateMatchDate",
      label = varglobal$labels$dateMatch
    )
  ),

  column(
    width = 3,
    actionButton(
      inputId = "btnAjouterMatch",
      label   = varglobal$labels$btnAjouterMatch,
      width   = "100%"
    )
  )
  
)