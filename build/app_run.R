library(shiny)
library(ggplot2)

## get the variables defined in KIOSC
app_title <- Sys.getenv("TITLE")
if(app_title == "") { app_title <- "Test app" }

dataset   <- Sys.getenv("DATASET")
if(dataset == "") { dataset <- "iris" } 

## TODO: check that this works
df <- get(dataset, "package:datasets")

runApp("app.R", launch.browser = FALSE, port = 8080, host = "0.0.0.0")

