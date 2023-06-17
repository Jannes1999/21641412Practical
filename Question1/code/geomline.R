line_bar <- function(alpha, size){
library(ggplot2)
Covid_non_na <- Covid1  %>% filter_at(vars(continent),all_vars(!is.na(.))) %>%  mutate(ratio_deaths_cases = (total_deaths_per_million/total_cases_per_million)*100) %>%
    group_by(continent, ratio_deaths_cases) %>% mutate(date = date, mean_ratio_deaths_cases = mean(ratio_deaths_cases)) %>% ungroup()

  g <- Covid_non_na %>%  ggplot()+
    # Now add the aesthetics:
geom_smooth(aes(x = date, y = mean_ratio_deaths_cases, color = continent,), alpha = alpha,
              size = size, na.rm = T) + theme_bw() +
      labs(title = "ratio of total deaths to total cases for the different continents", y = "mean ratio of death to cases", x = "Date" )

  g <- g + facet_wrap(~continent, scales = "free_y")
print(g)


}



