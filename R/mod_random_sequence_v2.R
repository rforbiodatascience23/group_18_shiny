#' random_sequence UI Function
#'
#' @description A shiny Module.
#'
#' @param id, input, output, session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_random_sequence_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, shiny::uiOutput(ns("DNA"))),
      column(4,
             shiny::numericInput(
               inputId = ns("dna_length"),
               value = 6000,
               min = 3,
               max = 100000,
               step = 3,
               label = "Random DNA length"
             ),
             shiny::actionButton(
               inputId = ns("generate_dna"),
               label = "Generate random DNA",
               style = "margin-top: 18px;"
             ),
             shiny::actionButton(
               inputId = ns("translate_dna"),
               label = "Translate",
               style = "margin-top: 18px;"
             )
      )
    ),
    fluidRow(
      column(8, shiny::uiOutput(ns("translate_dna")))
    )
  )
}

#' random_sequence Server Functions
#'
#' @noRd
mod_random_sequence_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value1 = "",  # Initialize with an empty string
        height = 100,
        width = 600
      )
    })

    observeEvent(input$generate_dna, {
      dna_sequence <- centralDogma::random_dna(input$dna_length)
      updateTextAreaInput(
        session,
        "DNA",
        value1 = dna_sequence
      )
    })

    output$translate_dna <- renderUI({
      textAreaInput(
        inputId = ns("translate_dna"),
        label = "Translation",
        placeholder = "Press Translate after generating the sequence",
        value2 = "",  # Initialize with an empty string
        height = 100,
        width = 600
      )
    })

    observeEvent(input$translate_dna, {
      dna_sequence <- isolate(input$DNA)
      if (!is.null(dna_sequence) && nchar(dna_sequence) >= 3) {
        translated_sequence <- dna_sequence |>
          toupper() |>
          centralDogma::transcribe() |>
          centralDogma::codon_split() |>
          centralDogma::translate()

        # Update the "translate_dna" textAreaInput with the translated sequence
        updateTextAreaInput(
          session,
          "translate_dna",
          value2 = translated_sequence
        )
      }
    })
  })
}
