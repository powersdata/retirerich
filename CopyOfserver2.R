library(shiny)
if (!require(FinCal)) {
        stop("This app requires the FinCal package. To install it, run 'install.packages(\"FinCal\")'.\n")
}
if (!require(lubridate)) {
        stop("This app requires the lubridate package. To install it, run 'install.packages(\"lubridate\")'.\n")
}
#library(FinCal)
#library(lubridate)

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
        
        set.seed(42)
        df <- data.frame(
                Date = as.Date(character()),
                Amt = double(),
                stringsAsFactors = FALSE
        )
        y<-0
        m <- years * 12
        k <- 1
        for (k in 1:m) {
                set.seed(42)
                if (k < 61) {
                        y <- .5 / 60
                        f <- .75
                }
                if (k > 60 & k < 121) {
                        y <- .15 / 60
                        f <- .4
                }
                if (k > 120) {
                        y <- .000000000001
                        f <- .1
                }
                norm <- rnorm(456, i, i*(f- (k * y)))
                newrow <-
                        data.frame(Sys.Date() %m+% months(k), fv(
                                norm, k/12, pv = current * -1, pmt = 0, type = 0
                        ))
                
                
                df <- rbind(df,newrow)
        }
        colnames(df) <- c("Date", "Estimated_Savings")
        df
        
}


shinyServer(function(input, output) {
        output$inputtype <- renderPrint({
                input$itype
        })
        output$inputsavings <- renderPrint({
                input$savings
        })
        output$inputyrs <- renderPrint({
                input$yrs
        })
        output$newplot <- renderPlot({
                thedata <- RetireEstimate(input$itype, input$yrs, input$savings)
                colnames(thedata) <- c("Date", "Estimated_Savings")
                plot(thedata, pch = 15, col = "lightgrey")
                abline(lm(thedata$Estimated_Savings~thedata$Date),col = "red")
        })
        
        
})
