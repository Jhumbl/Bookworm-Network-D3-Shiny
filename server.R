#
# This is the server logic of a Shiny web application. 
#

library(shiny)
library(curl)
library(networkD3)
library(RCurl)
library(d3Network)

# Read in network json files
URL_aiw <- paste0("https://raw.githubusercontent.com/Jhumbl/Bookworm-Network-D3-Shiny/master/D3_json_files/aliceinwonderland.json")
URL_pap <- paste0("https://raw.githubusercontent.com/Jhumbl/Bookworm-Network-D3-Shiny/master/D3_json_files/prideandprejudice.json")
URL_lesmis <- paste0("https://raw.githubusercontent.com/Jhumbl/Bookworm-Network-D3-Shiny/master/D3_json_files/lesmiserables.json")
URL_cap <- paste0("https://raw.githubusercontent.com/Jhumbl/Bookworm-Network-D3-Shiny/master/D3_json_files/crimeandpunishment.json")
URL_ge <- paste0("https://raw.githubusercontent.com/Jhumbl/Bookworm-Network-D3-Shiny/master/D3_json_files/greatexpectations.json")

networks <- list(URL_aiw, URL_pap, URL_lesmis, URL_cap, URL_ge)
n <- list()
l <- list()

# Convert to correct format format
for (i in networks){
  MisJson <- jsonlite::fromJSON(i)
  netDataLinks = data.frame(MisJson$links)
  netDataNodes = data.frame(MisJson$nodes)
  
  netDataLinks$source <- match(netDataLinks$source, netDataNodes$id) - 1
  netDataLinks$target <- match(netDataLinks$target, netDataNodes$id) - 1
  
  n <- append(n, list(netDataNodes))
  l <- append(l, list(netDataLinks))
}

MisJson <- jsonlite::fromJSON(URL_aiw)
netDataLinks = data.frame(MisJson$links)
netDataNodes = data.frame(MisJson$nodes)

netDataLinks$source <- match(netDataLinks$source, netDataNodes$id) - 1
netDataLinks$target <- match(netDataLinks$target, netDataNodes$id) - 1



# Define server logic required to draw a network
shinyServer(function(input, output) {
   
  output$Plot1 <- renderForceNetwork({
    forceNetwork(Links = l[[1]], Nodes = n[[1]], Source = "source",
                 Target = "target", Value = "value", NodeID = "id",
                 Group = "group", opacity = input$Opacity, zoom = TRUE, 
                 opacityNoHover = as.numeric(input$Labels))
  })
  output$Plot2 <- renderForceNetwork({
    forceNetwork(Links = l[[2]], Nodes = n[[2]], Source = "source",
                 Target = "target", Value = "value", NodeID = "id",
                 Group = "group", opacity = input$Opacity, zoom = TRUE, 
                 opacityNoHover = as.numeric(input$Labels))
  })
  output$Plot3 <- renderForceNetwork({
    forceNetwork(Links = l[[3]], Nodes = n[[3]], Source = "source",
                 Target = "target", Value = "value", NodeID = "id",
                 Group = "group", opacity = input$Opacity, zoom = TRUE, 
                 opacityNoHover = as.numeric(input$Labels))
  })
  output$Plot4 <- renderForceNetwork({
    forceNetwork(Links = l[[4]], Nodes = n[[4]], Source = "source",
                 Target = "target", Value = "value", NodeID = "id",
                 Group = "group", opacity = input$Opacity, zoom = TRUE, 
                 opacityNoHover = as.numeric(input$Labels))
  })
  output$Plot5 <- renderForceNetwork({
    forceNetwork(Links = l[[5]], Nodes = n[[5]], Source = "source",
                 Target = "target", Value = "value", NodeID = "id",
                 Group = "group", opacity = input$Opacity, zoom = TRUE, 
                 opacityNoHover = as.numeric(input$Labels))
  })
  
})
