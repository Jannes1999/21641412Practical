London_is_cold <- function(alpha = 0.7){
          # Lets get the date in the proper format
            London$date <- as.Date(London$date, format = "%Y-%m-%d", origin = "19790101")

        weather_data <- London %>%
          mutate(year = lubridate::year(date), month = lubridate::month(date, label = TRUE))

             ggplot(weather_data, aes(x = year, y = month, fill = mean_temp), alpha = alpha) +
                 geom_tile(color = "white") +
                    scale_fill_gradient(low = "blue", high = "red", na.value = "gray") +
                         labs(x = "Year", y = "Month", fill = "Mean Temperature",
                              title = "London Weather") +
                          theme_minimal() +
                      theme(axis.text = element_text(size = 8),
                                           legend.position = "bottom",
                                             plot.title = element_text(size = 16, face = "bold"))

}

London_is_cold(alpha = 0.7)
