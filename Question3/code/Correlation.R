Cor_bubbles <- function(){
    # Creating correlation between deaths in a location with differnt variables like smoking, life expectancy etc.
    Correlation_smoke <- Covid1 %>%
        mutate(total_smokers = male_smokers + female_smokers) %>%
        group_by(location) %>%
        summarize(correlation = cor(total_smokers, total_deaths, use = "pairwise.complete.obs"))

    print(Correlation_smoke)

}

Cor_bubbles()

Covid1 %>% group_by(location) %>%
    summarize(female_smokers, total_deaths) %>% cor(female_smokers, total_deaths)
