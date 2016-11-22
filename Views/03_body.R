

views$dashboardBody = dashboardBody(
  tabItems(
    tabItem(
      tabName = "idMenuNvMatch",
      tagList(views$tabItems$nvMatch)
    ),
    tabItem(
      tabName = "idMenuScores",
      tagList(views$tabItems$scores)
    )
  )
)