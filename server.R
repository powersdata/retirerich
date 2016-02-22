library(shiny)
library(FinCal)

RetireEstimate <- function(type, years, current) 
        {
        if (type == "Conservative") {i <- .05}
        if (type == "Moderate") {i <- .07}
        if (type == "Aggressive") {i <- .09}
        fv(i, years, pv = current * -1000, pmt = 0, type = 0)
        
        }

shinyServer(
        function(input, output) {
                output$inputtype <- renderPrint({input$itype})
                output$inputsavings <- renderPrint({input$savings})
                output$inputyrs <- renderPrint({input$yrs})
                output$estimate <- renderPrint({RetireEstimate(input$itype, input$yrs,
                                                               input$savings)})
        }
)

# library(shiny)
# 
# diabetesRisk <- function(glucose) 
#         {glucose / 200}
# 
# shinyServer(
#         function(input, output) {
#                 output$inputValue <- renderPrint({input$glucose})
#                 output$prediction <- renderPrint({diabetesRisk(input$glucose)})
#         }
# )
