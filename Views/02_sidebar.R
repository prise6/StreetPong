

views$dashboardSidebar = dashboardSidebar(
  sidebarMenu(
    id = "idSidebarMenu",
    
    selectInput(
      inputId = "selectTournoi",
      label = varglobal$labels$filtresTournois,
      choices = varglobal$choices$tournois,
      selected = 3
    ),
    
    uiOutput("sliderSemaines"),
    
    
    menuItem(
      text    = "Scores",
      tabName = "idMenuScores"
    ),
    
    menuItem(
      text    = "Nouveau match",
      tabName = "idMenuNvMatch"
    ),
    
    menuItem(
      text    = "Participants",
      tabName = "idMenuParticipants",
      
      lapply(1:nrow(joueurs), function(row){
        menuSubItem(
          text    = joueurs[row, pseudo],
          tabName = joueurs[row, paste0("id", pseudo)]
        )
      })
    )
  )
)