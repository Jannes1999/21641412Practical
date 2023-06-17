
top2_bottom2 <- function(){
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

print(filtered_data)
}
top2_bottom2()
