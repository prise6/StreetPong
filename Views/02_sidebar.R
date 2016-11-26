

views$dashboardSidebar = dashboardSidebar(
  sidebarMenu(
    id = "idSidebarMenu",
    
    selectInput(
      inputId = "selectTournoi",
      label = varglobal$labels$filtresTournois,
      choices = varglobal$choices$tournois
    ),
    
    sliderInput(
      inputId = "selectSemaines",
      label = varglobal$labels$filtresSemaines,
      min = min(varglobal$choices$semaines),
      # min = 47,
      max = max(varglobal$choices$semaines),
      # max = 48,
      value = c(min(varglobal$choices$semaines), max(varglobal$choices$semaines)),
      # value = c(47, 48),
      step = 1,
      ticks =  F
    ),
    
    
    
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