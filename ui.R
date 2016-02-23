library(shiny)

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
