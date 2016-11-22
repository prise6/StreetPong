

views$tabItems$scores = fluidRow(
  
  infoBoxOutput("IBnbrMatchs", width = 4),
  
  column(
    width = 12,
    dataTableOutput("dt.classement")
  )
  
)