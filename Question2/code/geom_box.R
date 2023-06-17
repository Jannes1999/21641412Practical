geom_box <- function(alpha = 0.7){
    # convert to dates from characteer to ymd format using lubridate
    library(lubridate)
    London$date <- ymd(London$date)

    temp_data <- London %>%
        select(date, mean_temperature)
    temp_summary <- temp_data %>%
        summarize(average_mean_temperature = mean(mean_temp, na.rm = TRUE))

    g <- temp_data %>%  ggplot(aes(x = factor(year), y = mean_temp)) +

         geom_boxplot(alpha = 0.7) +
        labs(x = "Year", y = "Mean Temperature (°C)", title = "Temperature Distribution in London") +
        theme_bw()

    print(g)

}
geom_box(alpha = 0.7)
