

views$tabItems$nvMatch = tagList(
  fluidRow(
    column(
      width = 10,
      class = "col-md-10 col-md-offset-1 col-sm-12",
      h1("Nouveau match")
    )
  ),
  
  fluidRow(
    column(
      width = 10,
      class = "col-md-10 col-md-offset-1 col-sm-12",
      
      fluidRow(
        box(
          width = 12,
          title = "Scores",
          status = "primary",
          solidHeader = T,
          tagList(
            fluidRow(
              div(
                class = "col-md-4 col-sm-8 col-xs-8",
                selectInput(
                  inputId = "selectMatchJoueur1",
                  label = varglobal$labels$selectMatchJoueur1,
                  choices = c("", varglobal$choices$joueurs),
                  width = "100%"
                )
              ),
              
              div(
                class = "col-md-1 col-sm-4 col-xs-4",
                selectInput(inputId = "selectMatchJoueur1NbrSet", label = varglobal$labels$selectMatchJoueur1NbrSet, choices = 0:2)
              ),
              
              div(
                class = "col-md-2 col-sm-12 col-xs-12 hidden-sm hidden-xs",
                div(
                  class = "text-center",
                  br(),
                  "-"
                )
              ),
              
              
              div(
                class = "col-md-4 col-sm-8 col-xs-8 col-md-push-1",
                selectInput(
                  inputId = "selectMatchJoueur2",
                  label = varglobal$labels$selectMatchJoueur2,
                  choices = c("", varglobal$choices$joueurs),
                  width = "100%"
                )
              ),
              
              div(
                class = "col-md-1 col-sm-4 col-xs-4 col-md-pull-4",
                selectInput(inputId = "selectMatchJoueur2NbrSet", label = varglobal$labels$selectMatchJoueur2NbrSet, choices = 0:2)
              )
            ),
            
            fluidRow(
              
              column(
                width = 3,
                selectInput(
                  inputId = "selectMatchTournois",
                  label   = varglobal$labels$tournoisMatch,
                  choices = c("", varglobal$choices$tournois[-1])
                )
              ),
              
              column(
                width = 6,
                textInput(
                  inputId = "textMatchCommentaires",
                  label = varglobal$labels$commentaireMatch,
                  width = "100%"
                )
              ),
              
              column(
                width = 3,
                dateInput(
                  inputId = "dateMatchDate",
                  label = varglobal$labels$dateMatch
                )
              )
            ),
            
            fluidRow( 
              column(
                width = 12,
                actionButton(
                  inputId = "btnAjouterMatch",
                  label   = varglobal$labels$btnAjouterMatch,
                  width   = "100%",
                  class = "btn-primary"
                ),
                uiOutput("ajouterMatchUI")
              )
            )
          )
        )
      )
    )
  )
)
