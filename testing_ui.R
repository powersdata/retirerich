library(shiny)
library(FinCal)
library(lubridate)


RetireEstimate <- function(type, years, current) 
{
        if (type == "Conservative") {i <- .05}
        if (type == "Moderate") {i <- .07}
        if (type == "Aggressive") {i <- .09}
        
        if (years < 5) {y <- .2}
        if (years > 4 | years < 10) {y <- .1}
        if (years > 9) {y <- .05}
        
        set.seed(42)
        norm <- rnorm(100, i, i*y)
        df <- data.frame(Date=as.Date(character()),
                         Amt=double(),
                         stringsAsFactors=FALSE)
            #k <- 0
        m <- years * 12        
        for (k in 1:m) {
                
                
                print(k)
                newrow <- data.frame(Sys.Date()%m+% months(k), fv(norm, k/12, pv = current * -1, pmt = 0, type = 0))
                
                                     
                df <- rbind(df,newrow)
        }
 
        
  
}
colnames(df) <- c("Date", "Estimated_Savings")
plot(df)


shinyServer(
        function(input, output) {
                output$inputtype <- renderPrint({input$itype})
                output$inputsavings <- renderPrint({input$savings})
                output$inputyrs <- renderPrint({input$yrs})
                output$estimate <- renderPrint({RetireEstimate(input$itype, input$yrs,
                                                               input$savings)})
        }
)



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
        norm <- rnorm(345, i, i * y)
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


