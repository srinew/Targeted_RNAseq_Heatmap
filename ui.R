ui <- fluidPage(
  
  HTML('<meta name="viewport" content="width=1024">'),
  # Application title
  titlePanel(div(HTML("RNA-Seq Count Normalized Heatmap"))),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      # checkboxInput("header", "Header", TRUE), 
      radioButtons("select_class",
                         "Normalization method:",
                         selected = c("Housekeeping normalization"),
                         choiceNames = list("Housekeeping normalization",
                                            "edgeR TMM normalization"),
                         choiceValues = list("Housekeeping normalization",
                                             "edgeR TMM normalization"),
                         width = 2000),
      radioButtons("select_class_1",
                   "Sample Clustering:",
                   selected = c("Yes"),
                   choiceNames = list("Yes",
                                      "No"),
                   choiceValues = list("Yes",
                                       "No"),
                   width = 200),
      radioButtons("select_class_2",
                   "Clustering method:",
                   selected = c("ward.D2"),
                   choiceNames = list("ward.D2",
                                      "ward.D",
                                      "single",
                                      "complete",
                                      "average",
                                      "median"),
                   choiceValues = list("ward.D2",
                                       "ward.D",
                                       "single",
                                       "complete",
                                       "average",
                                       "median"),
                   width = 200),
      downloadButton("export", label = "download heatmap"),
      width = 2),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
