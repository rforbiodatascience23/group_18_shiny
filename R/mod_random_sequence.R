#' random_sequence UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_random_sequence_ui <- function(id){
  ns <- NS(id)
  tagList(fluidRow(
    column(8, "DNA_sequence"),
    column(4, "random_dna_length", "generate_dna_button")
  ),
  "peptide_sequence"

  )
}

#' random_sequence Server Functions
#'
#' @noRd
mod_random_sequence_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_random_sequence_ui("random_sequence_1")

## To be copied in the server
# mod_random_sequence_server("random_sequence_1")
