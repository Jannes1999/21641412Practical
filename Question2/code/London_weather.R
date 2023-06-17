
London_weather <- function(alpha = 0.7 ){

    ggplot(London) +
    geom_line(aes(x = date, y = mean_temp),color = "blue") +
    labs(x = "Date", y = "Mean Temperature",
         title = "London Weather") +
    theme_minimal()
}
London_weather()
