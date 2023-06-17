Poverty_rates <- function(alpha) {

 Remove_NA <- Covid1 %>%
        filter(!is.na(extreme_poverty) & !is.na(total_deaths_per_million))

 summary_data <- Remove_NA %>%
        group_by(location, date) %>%
        summarise(avg_poverty = mean(extreme_poverty),
                  total_deaths_per_million = sum(total_deaths_per_million)) %>% ungroup()

 filtered_data <- summary_data %>%
     group_by(location) %>%
     summarise(avg_poverty = mean(avg_poverty)) %>%
     arrange(avg_poverty) %>%
     head(2) %>%
     bind_rows(summary_data %>%
                   group_by(location) %>%
                   summarise(avg_poverty = mean(avg_poverty)) %>%
                   arrange(desc(avg_poverty)) %>%
                   head(n = 2))

 filtered_data <- summary_data %>%
     filter(location %in% c("Democratic Republic of Congo", "Jordan", "Kazakhstan", "Madagascar"))

 # Create the line plot
 ggplot(filtered_data) +
     geom_line(aes(x = date, y = total_deaths_per_million, color = location)) +
     labs(x = "Date", y = "Total Deaths per million",
          title = "Total Deaths(per million) due to COVID-19 Over Time") +
     theme_bw()


    }
