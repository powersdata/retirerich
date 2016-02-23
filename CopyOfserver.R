library(shiny)
library(FinCal)
library(lubridate)

RetireEstimate <- function(type, years, current)
{
        if (type == "Conservative") {
                i <- .05
        }
        if (type == "Moderate") {
                i <- .07
        }
        if (type == "Aggressive") {
                i <- .09
        }
        
        if (years < 5) {
                y <- .2
        }
        if (years > 4 | years < 10) {
                y <- .1
        }
        if (years > 9) {
                y <- .05
        }
        
        set.seed(42)
        norm <- rnorm(1000, i, i * y)
        df <- data.frame(
                Date = as.Date(character()),
                Amt = double(),
                stringsAsFactors = FALSE
        )
        k <- 0
        
        for (k in seq(0,years, by = 1 / 12)) {
                t <- as.integer(k * 12)
                newrow <-
                        data.frame(Sys.Date() %m+% months(t), fv(
                                norm, k, pv = current * -1, pmt = 0, type = 0
                        ))
                
                
                df <- rbind(df,newrow)
        }
        colnames(df) <- c("Date", "Estimated_Savings")
        df
        
}

# RetireEstimate <- function(type, years, current) 
#         {
#         if (type == "Conservative") {i <- .05}
#         if (type == "Moderate") {i <- .07}
#         if (type == "Aggressive") {i <- .09}
#         fv(i, years, pv = current * -1, pmt = 0, type = 0)
#         
#         }



shinyServer(
        function(input, output) {
                output$inputtype <- renderPrint({input$itype})
                output$inputsavings <- renderPrint({input$savings})
                output$inputyrs <- renderPrint({input$yrs})
                output$newplot <- renderPlot({
                        plot(RetireEstimate(input$itype, input$yrs, input$savings))
                })
                
                
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
