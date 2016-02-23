# library(shiny)
# 
# # Define UI for dataset viewer application
# shinyUI(
#         pageWithSidebar(
#                 # Application title
#                 headerPanel("Savings at Retirement"),
#                 
#                 sidebarPanel(
#                         numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
#                         submitButton('Submit')
#                 ),
#                 mainPanel(
#                         h3('Results of prediction'),
#                         h4('You entered'),
#                         verbatimTextOutput("inputValue"),
#                         h4('Which resulted in a prediction of '),
#                         verbatimTextOutput("prediction")
#                 )
#         )
# )

library(shiny)
library(FinCal)

shinyUI(fluidPage(
        titlePanel("Savings at Retirement"),
        
        sidebarLayout(
                sidebarPanel(
                        radioButtons(
                                "itype", "Investor Type:",
                                c(
                                        "Conservative" = "Conservative",
                                        "Moderate" = "Moderate",
                                        "Aggressive" = "Aggressive"
                                )
                        ),
                        numericInput('yrs', 'Years to Retirement', 2, min = 2),
                        numericInput(
                                'savings', 'Amount of current savings', 1000, min = 1000, step = 1000
                        ),
                        
                        submitButton('Submit')
                        
                ),
                mainPanel(
                        h3('Predicted Savings'),
                        h4('Investor Type of'),
                        verbatimTextOutput("inputtype"),
                        h4('With Savings of'),
                        verbatimTextOutput("inputsavings"),
                        h4('and this many years to retirement'),
                        verbatimTextOutput("inputyrs"),
                        h4('Estimated amount at the start of retirement'),
                        plotOutput("newplot")
                )
                
        )
))




# shinyUI(fluidPage(
#         
#         # Application title
#         titlePanel("Hello Shiny!"),
#         
#         sidebarLayout(
#                 
#                 # Sidebar with a slider input
#                 sidebarPanel(
#                         sliderInput("obs",
#                                     "Number of observations:",
#                                     min = 0,
#                                     max = 1000,
#                                     value = 500)
#                 ),
#                 
#                 # Show a plot of the generated distribution
#                 mainPanel(
#                         plotOutput("distPlot")
#                 )
#         )
# ))

# shinyUI(fluidPage(
#         
#         titlePanel("Hello Shiny!"),
#         
#         sidebarLayout(
#                 
#                 sidebarPanel(
#                         sliderInput("obs", "Number of observations:",  
#                                     min = 1, max = 1000, value = 500)
#                 ),
#                 
#                 mainPanel(
#                         plotOutput("distPlot")
#                 )
#         )
# ))











# shinyUI(
#         pageWithSidebar(
#                 # Application title
#                 headerPanel("Savings at Retirement"),
#                 
#                 sidebarPanel(
#                         numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
#                         submitButton('Submit')
#                 ),
#                 mainPanel(
#                         h3('Results of prediction'),
#                         h4('You entered'),
#                         verbatimTextOutput("inputValue"),
#                         h4('Which resulted in a prediction of '),
#                         verbatimTextOutput("prediction")
#                 )
#         )
# )
