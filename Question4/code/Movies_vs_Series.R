Movie_vs_series <- function(alpha){
   library(tidyverse)

    movie_subset <- titles %>%
        filter(type == "MOVIE")

    series_subset <- titles %>%
        filter(type == "SERIES")

   percentage_above_7_movie <- movie_subset %>%
        filter(type == "MOVIE", imdb_score > 7) %>%
       summarise(percentage = n()/nrow(movie_subset)*100)

   percentage_above_7_series <- series_subset %>%
       filter(type == "SERIES", imdb_score > 7) %>%
       summarise(percentage = n()/nrow(series_subset)*100)

   percentage_below_5_movie <- movie_subset %>%
       filter(type == "MOVIE", imdb_score < 5) %>%
       summarise(percentage = n()/nrow(movie_subset)*100)

   percentage_below_5_series <- movie_subset %>%
       filter(type == "SERIES", imdb_score < 5) %>%
       summarise(percentage = n()/nrow(series_subset)*100)

   titles %>%
        group_by(type) %>% summarise(mean_rating = mean(imdb_score, na.rm = T)) %>%
       mutate(mean_rating = as.numeric(mean_rating)) %>% ungroup() %>%

     ggplot() +
        geom_col(aes(x = mean_rating, y = type, fill = type),alpha = 0.7) +
        labs(x = "Average Imdb Rating", y = " Type", title = "Movies vs Series") +
        theme_bw() +
       geom_text()


}
Movie_vs_series()


titles %>%
    group_by(type) %>% summarise(mean_rating = mean(imdb_score, na.rm = T)) %>% ungroup()




