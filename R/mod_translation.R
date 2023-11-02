#' translation UI Function
#'
#' @description A shiny Module for translation.
#'
#' @param id, input, output, session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_translation_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      shiny::verbatimTextOutput(outputId = ns("translated_sequence")) |>
        shiny::tagAppendAttributes(style = "white-space: pre-wrap;")
    )
  )
}

#' translation Server Functions
#'
#' @noRd
mod_translation_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$translated_sequence <- renderText({
      dna_sequence <- isolate(input$DNA)
      if (!is.null(dna_sequence) && nchar(dna_sequence) >= 3) {
        translated_sequence <- dna_sequence |>
          toupper() |>
          centdog::transcription() |>
          centdog::aa_codon_translation() |>
          centdog::translation()
        return(translated_sequence)
      } else {
        return(NULL)
      }
    })
  })
}
