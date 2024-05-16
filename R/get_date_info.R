#' Functie om informatie te verkrijgen voor een specifieke bemonsteringsdatum
#'
#' Deze functie filtert de dataset voor een specifieke bemonsteringsdatum en retourneert de unieke combinatie van stad, provincie en geslacht.
#'
#' @param data Het dataframe met de gegevens, waarin de kolommen sampling_date, institute_city, institute_province, person_gender bevat.
#' @param sampling_date De specifieke bemonsteringsdatum waarvoor de informatie moet worden verkregen
#' @return Een dataframe met de unieke combinatie van stad, provincie en geslacht voor de opgegeven bemonsteringsdatum
#' @export
get_date_info <- function(data, sampling_date) {
  # Controleer of de vereiste kolommen aanwezig zijn in de dataset
  if (!("sampling_date" %in% colnames(data)) | !("institute_city" %in% colnames(data)) |
      !("institute_province" %in% colnames(data)) | !("person_gender" %in% colnames(data))) {
    stop("De vereiste kolommen zijn niet aanwezig in de dataset.")
  }
  
  # Filter de data voor de opgegeven sampling_date
  filtered_data <- subset(data, sampling_date == sampling_date)
  
  # Selecteer alleen de relevante kolommen
  filtered_data <- subset(filtered_data, select = c("institute_city", "institute_province", "person_gender"))
  
  # Verwijder duplicaten om een unieke combinatie van institute_city, province en person_gender te krijgen
  unique_data <- unique(filtered_data)
  
  # Retourneer de resultaten
  return(unique_data)
}

