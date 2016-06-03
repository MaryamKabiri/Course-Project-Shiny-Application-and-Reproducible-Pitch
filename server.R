library(shiny)
setwd("C:/Users/Maryam/Desktop/Datascientists/Developing Data Product/Project")

data <- read.csv("outcome-of-care-measures.csv")

best <- function(state, outcome) {
  
  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  statedata <- data[grep(state, data$State), ]
  orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ]
  orderdata[1, 2]
}

shinyServer(
  function(input, output){
    output$inputvalues<-renderPrint({paste(input$state, ",",
                                           input$outcome)})
    output$besthospital<-renderPrint({paste(best(input$state, input$outcome))})
    }
  )