## this app needs the following variables:
## df - a data frame with some data and named columns
## dataset - the name of the dataset
## title - a character vector of length 1

varnames <- colnames(df)

ui <- fluidPage(
 titlePanel(app_title),
 fluidRow(p(sprintf("Dataset %s", dataset))),
 sidebarLayout(
   sidebarPanel(

     selectInput("xvar",  label="X covariate", choices=varnames),
     selectInput("yvar",  label="Y covariate", choices=varnames, selected=varnames[2]),
     selectInput("color", label="Color by", choices=c("NA", varnames)),
     selectInput("symbol", label="Symbol by", choices=c("NA", varnames)),
     selectInput("trellis", label="Trellis (facet) by", choices=c("NA", varnames)),
     ),

    mainPanel(
              plotOutput("mainplot")
              )
))

## the server function only takes care of one element – the main plot
## output
server <- function(input, output) {

  output$mainplot <- renderPlot({

    g <- ggplot(df, aes_string(x=input$xvar, y=input$yvar))

    if(input$color != "NA")   { g <- g + aes_string(color=input$color) }
    if(input$symbol != "NA")  { g <- g + aes_string(shape=input$symbol) }
    if(input$trellis != "NA") { g <- g + facet_wrap(input$trellis) }
   
    g <- g + geom_point()
    print(g)
  })

}

## create the shiny app
shinyApp(ui=ui, server=server)
