#' Functie om het aantal antibioticaresistentie classes per provincie te plotten
#' 
#' Deze functie groepeert de gegevens per provincie en telt het aantal antibioticaresistentie classes per provincie. Vervolgens maakt het een barplot van het aantal classes per provincie.
#'
#' @param data Een dataframe met de gegevens, waarin de kolom institute_province de provincie aanduidt en de kolom n_classes_antibiotica het aantal antibioticaresistentie classes bevat.
#' @return Een ggplot-object met de barplot van het aantal antibioticaresistentie classes per provincie.
#' @export
plot_ab_resis <- function(data) {
  # Vereiste bibliotheken laden
  library(dplyr)
  library(ggplot2)
  
  # Groepeer de gegevens per provincie en tel het aantal classes per provincie
  data_summary <- data %>%
    group_by(institute_province) %>%
    summarize(n_classes_resistent = n())
  
  # Maak een barplot van het aantal classes per provincie
  ggplot(data_summary, aes(x = institute_province, y = n_classes_resistent)) +
    geom_col() +
    labs(title = "Aantal antibioticaresistentie classes per provincie",
         x = "Provincie",
         y = "Aantal antibioticaresistentie classes") +
    theme_minimal()
}

