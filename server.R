#server.R
#library(shiny)

function(input, output){
  output$boxplot <- renderPlot({
    cvK = input$cvK
    n = input$n
    knn = input$k
    g = input$genes
    if (input$classifiers == "KNN"){ 
      KNNplot(cvK,n,knn,g)
    }
    if (input$classifiers == "SVM") {
      SVMplot(input$cvK1,input$n1,g)
    }
    if (input$classifiers == "RF") {
      RFplot(input$cvK1,input$n1,g)
    }
  })
}

shinyApp(ui = ui, server = server)