#' Functie om metadata te laden
#'
#' Deze functie leest een CSV-bestand in vanuit het opgegeven pad en retourneert de metadata.
#'
#' @param file_path Het pad naar het CSV-bestand
#' @return Een dataframe met de geladen metadata
#' @export
Load_metadata <- function(file_path) {
  metadata <- read.csv2(file_path)
  # Voer hier eventuele verwerkingsstappen uit als dat nodig is
  return(metadata)
}
