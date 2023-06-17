Movie_vs_series <- function(alpha,fig.width=6, fig.height=4){
   library(tidyverse)

   titles %>%
        group_by(type) %>% summarise(mean_rating = mean(imdb_score, na.rm = T)) %>%
       mutate(mean_rating = as.numeric(mean_rating)) %>% ungroup() %>%

     ggplot() +
        geom_col(aes(x = mean_rating, y = type, fill = type),alpha = 0.7) +
        labs(x = "Average Imdb Rating", y = " Type", title = "Movies vs Series") +
        theme_bw()


}







