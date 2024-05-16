#' Functie om de antibiotic class op te halen op basis van postcode en geboortejaar
#'
#' Deze functie zoekt in de gegeven dataset naar de antibiotic class van een persoon met de opgegeven postcode en geboortejaar.
#'
#' @param zipcode De postcode van de persoon
#' @param year_of_birth Het geboortejaar van de persoon
#' @param data Het dataframe met de gegevens waarin de kolommen zipcode, antibiotic_class en person_birthyear bevat.
#' @return De antibiotic class van de persoon, of een foutmelding als er geen gegevens zijn gevonden
#' @export
get_antibiotic_class <- function(zipcode, year_of_birth, data) {
  # Filter de data op basis van de gegeven postcode en geboortejaar
  filtered_data <- data[data$person_zipcode == zipcode & data$person_birthyear == year_of_birth, ]
  
  # Controleer of er overeenkomstige gegevens zijn gevonden
  if (nrow(filtered_data) == 0) {
    return("Geen gegevens gevonden voor de opgegeven postcode en geboortejaar.")
  }
  
  # Haal de antibioticaclassificatie op
  antibiotic_class <- unique(filtered_data$antibiotic_class)
  
  # Als er meerdere antibioticaklassen zijn gevonden, geef ze terug gescheiden door komma's
  if (length(antibiotic_class) > 1) {
    return(paste("Antibiotic Class:", paste(antibiotic_class, collapse = ", ")))
  } else {
    return(paste("Antibiotic Class:", antibiotic_class))
  }
}
