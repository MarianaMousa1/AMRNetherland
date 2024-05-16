#' Functie om de prevalentie van een resistentiegen te berekenen
#'
#' Deze functie berekent de prevalentie van een opgegeven resistentiegen in de dataset.
#'
#' @param gene Het resistentiegen waarvan de prevalentie moet worden berekend
#' @param data Het dataframe met de gegevens, waarin de kolom resfinder_genes bevat
#' @return De prevalentie van het opgegeven resistentiegen in de dataset
#' @export
calculate_resgene_prevalence <- function(gene, data) {
  # Controleer of de kolom 'resfinder_genes' aanwezig is in de dataset
  if (!("resfinder_genes" %in% colnames(data))) {
    stop("De vereiste kolom 'resfinder_genes' is niet aanwezig in de dataset.")
  }
  
  # Split de resfinder_genes kolom om individuele genen te verkrijgen
  all_genes <- unlist(strsplit(as.character(data$resfinder_genes), ","))
  
  # Bereken de prevalentie van het opgegeven resistentiegen in de dataset
  gene_prevalence <- sum(all_genes == gene, na.rm = TRUE) / length(all_genes)
  
  # Retourneer de prevalentie als percentage
  output <- paste("De prevalentie van dit resistentiegen is", gene_prevalence * 100, "%")
  return(output)
}

