#ui.R
#library(shiny)

fluidPage(
  pageWithSidebar(
    headerPanel("Performance of Classification Models"),
    
    sidebarPanel(
      selectInput(inputId = "classifiers", label = "Choose ML Technique", choices = c("K-nearest neighbors" = "KNN", "Support Vector Machine" = "SVM", "Random Forest" = "RF")),
      numericInput(inputId = "genes", label = "Choose no. of genes", value = 5000, min = 1, max = 11721),
      tags$head(tags$style(HTML('.irs-from, .irs-to, .irs-min, .irs-max {
            visibility: hidden !important;
    }'))),
      
      conditionalPanel(
        condition = "input.classifiers == 'KNN'",
        tags$head(tags$style(HTML('.irs-from, .irs-to, .irs-min, .irs-max {
            visibility: hidden !important;
    }'))),
        sliderInput(inputId = "k", label = "Choose no. of nearest neighbours", min = 1, max = 300, value = 5),
        numericInput(inputId = "cvK", label = "Choose no. of Cross Validation folds", value = 5, min = 1, max = 100),
        numericInput(inputId = "n", label = "Choose no. of simulations", value = 25, min = 1, max = 300)),
      conditionalPanel(
        condition = "input.classifiers != 'KNN'",
        tags$head(tags$style(HTML('.irs-from, .irs-to, .irs-min, .irs-max {
            visibility: hidden !important;
    }'))),
        numericInput(inputId = "cvK1", label = "Choose no. of Cross Validation folds", value = 5, min = 1, max = 25),
        numericInput(inputId = "n1", label = "Choose no. of simulations", value = 25, min = 1, max = 300))),
    
    mainPanel(
      plotOutput("boxplot")
    ))
)