library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products - Course Project'),
    sidebarPanel(
     h3('Instructions'),
     p('Enter the State, and diseases type to find the best (i.e. lowest) 30-day mortality for 
       the specific disease in that state.'),
    # h4('Please enter the 2-character abbreviated name of a state and a disease type below.'),
     selectInput('state', 'State', choices = state.abb), 
     radioButtons('outcome', 'Type of Disease:', c('heart attack' = 'heart attack', 
                                                   'heart failure' = 'heart failure', 
                                                   'pneumonia' = 'pneumonia'))
                    ), 
  mainPanel(
    h3('Best Hospital'),
    h4('You entered:'),
    verbatimTextOutput('inputvalues'),
    h4('Name of best hospital:'),
    verbatimTextOutput('besthospital'),
    h3('Method'),
    p('I write a function that take two arguments: the 2-character abbreviated name of a state 
      and three different types of diseases. I use outcome-of-care-measures.csv file which contains
      information about 30-day mortality and readmission rates for heart attacks, heart failure, 
      and pneumonia for over 4,000 hospitals. The outcome is the name of hospital that has the 
      best (i.e. lowest) 30-day mortality for the specified diseases in that state.')
  )
))
