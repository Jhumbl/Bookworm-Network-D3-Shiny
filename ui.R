# ============================================================
# Network Data Analysis - Bookworm D3 Visualisations
# ============================================================

# Install Relevant Packages
library(shiny)
library(curl)
library(markdown)
library(networkD3)
library(shinydashboard)

# Set up User Interface
ui <- dashboardPage(
  dashboardHeader(title = "Network D3 Visualisations"),
  # Sidebar
  dashboardSidebar(
    hr(),
    sidebarMenu( id = "tabs",
                 menuItem("Alice in Wondrland", tabName = "Plot1", icon = icon("book")),
                 menuItem("Pride and Prejudice", tabName = "Plot2", icon = icon("book-open")),
                 menuItem("Les Miserables", tabName = "Plot3", icon = icon("book")),
                 menuItem("Crime and Punishment", tabName = "Plot4", icon = icon("book-open")),
                 menuItem("Great Expectations", tabName = "Plot5", icon = icon("book")),
                 menuItem("About and Code",  icon = icon("file-text-o"),
                          menuSubItem("About and Sources", tabName = "about", icon = icon("angle-right")),
                          menuSubItem("ui.R", tabName = "ui", icon = icon("angle-right")),
                          menuSubItem("server.R", tabName = "server", icon = icon("angle-right"))
                 ),
                 hr()
                 
    ),
    tabPanel("Panel",
             checkboxInput("Labels", "Include Labels", value = FALSE),
             sliderInput("Opacity", "Opacity", min = 0, max = 1, value = 0.8)
    )
  ),
  # Main Body
  dashboardBody(
    tabItems(
      tabItem(tabName = "Plot1",
              fluidRow(
                box(
                  collapsible =  TRUE, title = "Alice in Wonderland",
                  status = "primary", solidHeader = TRUE,
                  forceNetworkOutput('Plot1', width = "100%", height = "600px"),
                  width = 12,
                  height = "900px"
                )
              )
      ),
      tabItem(tabName = "Plot2",
              fluidRow(
                box(
                  collapsible =  TRUE, title = "Pride and Prejudice",
                  status = "primary", solidHeader = TRUE,
                  forceNetworkOutput('Plot2', width = "100%", height = "600px"),
                  width = 12,
                  height = "900px"
                )
              )
      ),
      tabItem(tabName = "Plot3",
              fluidRow(
                box(
                  collapsible =  TRUE, title = "Les Miserables",
                  status = "primary", solidHeader = TRUE,
                  forceNetworkOutput('Plot3', width = "100%", height = "800px"),
                  width = 12,
                  height = "900px"
                )
              )
      ),
      tabItem(tabName = "Plot4",
              fluidRow(
                box(
                  collapsible =  TRUE, title = "Crime and Punishment",
                  status = "primary", solidHeader = TRUE,
                  forceNetworkOutput('Plot4', width = "100%", height = "800px"),
                  width = 12,
                  height = "900px"
                )
              )
      ),
      tabItem(tabName = "Plot5",
              fluidRow(
                box(
                  collapsible =  TRUE, title = "Great Expectations",
                  status = "primary", solidHeader = TRUE,
                  forceNetworkOutput('Plot5', width = "100%", height = "800px"),
                  width = 12,
                  height = "900px"
                )
              )
      ),
      tabItem(tabName = "about",
              box( width = NULL, status = "primary", solidHeader = TRUE, title="About",
                   br(),br(),
                   pre(includeMarkdown("README.md"))
              )
      ),
      tabItem(tabName = "ui",
              box( width = NULL, status = "primary", solidHeader = TRUE, title="ui.R",
                   br(),br(),
                   pre(includeText("ui.R"))
              )
      ),
      tabItem(tabName = "server",
              box( width = NULL, status = "primary", solidHeader = TRUE, title="server.R",
                   br(),br(),
                   pre(includeText("server.R"))
              )
      )
    )
  )
)
