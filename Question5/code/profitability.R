profitability <- function(alpha){

     profitability1 <- google_playstore %>%
         mutate(Price = gsub("\\$", " ", Price)) %>%
         mutate(Price = as.numeric(Price)) %>%
         filter(Type == "Paid") %>%
        group_by(Category) %>%
        summarise(total_revenue = sum(Price)) %>%
        arrange(desc(total_revenue))


    plot_profitability <- profitability1 %>%  ggplot() +
        geom_col(aes(x = Category, y = total_revenue),fill = "steelblue", alpha = 0.7)  +
        labs(x = "Category", y = "Total Revenue", title = "Profitability by app category") +
        ggtitle("Profitability by App Category") +
        theme(axis.text.x = element_text(angle = 45, hjust = 1))

   print(plot_profitability)
}





