table_of_extremes <- function(){
movie_subset <- titles %>%
    filter(type == "MOVIE")

series_subset <- titles %>%
    filter(type == "SHOW")

percentage_above_7_movie <- movie_subset %>%
    filter(type == "MOVIE", imdb_score > 7) %>%
    summarise(percentage = n()/nrow(movie_subset)*100)

percentage_above_7_series <- series_subset %>%
    filter(type == "SHOW", imdb_score > 7) %>%
    summarise(percentage = n()/nrow(series_subset)*100)

percentage_below_5_movie <- movie_subset %>%
    filter(type == "MOVIE", imdb_score < 5) %>%
    summarise(percentage = n()/nrow(movie_subset)*100)

percentage_below_5_series <- movie_subset %>%
    filter(type == "SHOW", imdb_score < 5) %>%
    summarise(percentage = n()/nrow(series_subset)*100)

tab <- matrix(c(percentage_above_7_movie, percentage_above_7_series, percentage_below_5_movie, percentage_below_5_series), ncol = 2, byrow = TRUE)
colnames(tab) <- c("Movies", "Show")
rownames(tab) <- c("Above 7 rating", "Below 5 rating")

tab

}

