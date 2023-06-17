geom_bar1 <- function(alpha){
    library(tidyverse)
    library(stringr)

    Containing <- c("Remaster|Remastered|Live In|(Live)")
    Valid_albums <-  metallica[!grepl(Containing, metallica$album), ]

    g <- Valid_albums %>%  ggplot() +
        geom_boxplot(aes(x = album, y = popularity, fill = album ), alpha = alpha) +
        theme_bw() +
        labs(y = "popularity", title = "Popularity by album") +
        guides(fill = F, color = F) +
        scale_fill_hue(l=40, c=35) +
        scale_color_hue(l=40, c=35) +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))

    print(g)
}
geom_bar1(alpha = 0.4)
