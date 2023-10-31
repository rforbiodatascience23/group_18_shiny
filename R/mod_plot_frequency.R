#' plot_frequency UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plot_frequency_ui <- function(id){
  ns <- NS(id)
  tagList(sidebarLayout(
    sidebarPanel(
      "Random Sequence"
    ),
    mainPanel(
      "Plot Frequency"
    )
  )

  )
}

#' plot_frequency Server Functions
#'
#' @noRd
mod_plot_frequency_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_plot_frequency_ui("plot_frequency_1")

## To be copied in the server
# mod_plot_frequency_server("plot_frequency_1")
