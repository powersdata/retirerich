library(shiny)
shinyUI(pageWithSidebar(
        # Application title
        headerPanel("Estimated Savings at Retirement"),
        # Sidebar with controls to select the type of investor
        # and number of years to retirement
        # and amount of current savings
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
        mainPanel(tabsetPanel(
                tabPanel(
                        "Plot",
                        h3('Predicted Savings'),
                        h4('Investor Type of'),
                        verbatimTextOutput("inputtype"),
                        h4('With Savings of'),
                        verbatimTextOutput("inputsavings"),
                        h4('and this many years to retirement'),
                        verbatimTextOutput("inputyrs"),
                        h4('Estimated amount at the start of retirement'),
                        plotOutput("newplot")
                ),
                tabPanel(
                        "Documentation",
                        h3('How to run'),
                        h4('Share as two R files'),
                        h4(
                                'Anyone with R can run my Shiny app. You will need a copy of my server.R and ui.R files, as well as any supplementary materials used in my app (here:.nojekyll). Place the files into an app directory in your working directory.'
                        ),
                        h4('You can launch the app in R with the following commands:'),
                        tags$div(tags$ul(
                                tags$li("install.packages(“shiny”)"),
                                tags$li("library(shiny)"),
                                tags$li("runApp()")
                        )),
                        h4('Once the app is running, you do the following:'),
                        tags$div(tags$ul(
                                tags$li("Select your investor type"),
                                tags$li("Fill in your years to retirement"),
                                tags$li("Provide your current savings amount")
                        )),
                        h4(
                                'You will then hit the "Submit" button and your retirement savings will be plotted.'
                        )
                )
        ))
))