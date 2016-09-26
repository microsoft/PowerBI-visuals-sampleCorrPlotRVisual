if (!exists("settings_method"))
{
    settings_method = "circle";
}

######### Validate Input #########

errorText <- NULL
#filter out non-numeric columns and constant columns
correctColumn <- function(someColumn) { is.numeric(someColumn) && length(unique(someColumn)) > 1 }
useColumns <- sapply(Values,correctColumn)
if(sum(useColumns) < ncol(Values))
  errorText <- "Filtered out non numeric columns and constant columns"

Values <- as.data.frame(Values[,useColumns])

columnCount <- ncol(Values)
rowCount <- nrow(Values)

if (rowCount < 2 || columnCount < 2) {
    plot.new()
    errorText<-paste(errorText, "Not enough input dimensions", sep="\n")
    title(main = NULL, sub = errorText, outer = FALSE, col.sub = "gray50", cex.sub = 0.75)
    quit()
}

######### Script #########

library(corrplot)
M <- cor(Values)
corrplot(M, method=settings_method)