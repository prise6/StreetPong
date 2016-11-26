

views$tabItems$scores = fluidRow(
  
  infoBoxOutput("IBnbrMatchs", width = 4),
  infoBoxOutput("IBnbrJoueurs", width = 4),
  infoBoxOutput("IBjoueursPremier", width = 4),
  
  
  
  div(
    class = "col-md-6 col-sm-12 col-xs-12",
    fluidRow(
      box(
        title = "Classement",
        width = 12,
        solidHeader = T,
        status = "primary",
        dataTableOutput("dt.classement")
      )
    )
  ),
  div(
    class = "col-md-6 col-sm-12 col-xs-12",
    fluidRow(
      box(
        title = "Derniers matchs",
        status = "primary",
        solidHeader = T,
        width = 12,
        dataTableOutput("dt.matchs")
      )
    )
  )
)