

views$dashboardSidebar = dashboardSidebar(
  sidebarMenu(
    id = "idSidebarMenu",
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