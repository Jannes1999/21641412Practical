line_bar <- function(alpha, size){
library(ggplot2)
Covid_non_na <- Covid1  %>% filter_at(vars(continent),all_vars(!is.na(.))) %>%  mutate(ratio_deaths_cases = (total_deaths_per_million/total_cases_per_million)*100) %>%
    group_by(continent, ratio_deaths_cases) %>% mutate(date = date, mean_ratio_deaths_cases = mean(ratio_deaths_cases)) %>% ungroup()

  g <- Covid_non_na %>%  ggplot()+
    # Now add the aesthetics:
geom_smooth(aes(x = date, y = mean_ratio_deaths_cases, color = continent,), alpha = alpha,
              size = size, na.rm = T) + theme_bw()

  g <- g + facet_wrap(~continent, scales = "free_y")
print(g)


Covid_totalvac <- Covid1 %>% filter_at(vars(continent),all_vars(!is.na(.))) %>% summa

     g <- g +geom_line()

}

line_bar(alpha = 0.8, size = 1)

