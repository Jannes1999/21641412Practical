
size_summary <- function(ignore.case = TRUE){

    size_sum <- google_playstore %>%
        filter(!grepl("Varies with device",Size, ignore.case = ignore.case)) %>%
        filter(!grepl("NA",Size, ignore.case = TRUE)) %>%
        mutate(Size = gsub("M", "000000", Size)) %>%
        mutate(Size = gsub("k", "000", Size)) %>%
        mutate(Size = as.numeric(Size)) %>%
        group_by(Category) %>%
        summarise(avg_Size = mean(Size),
                  min_Size = min(Size),
                  max_Size = max(Size)) %>%
        arrange(desc(avg_Size))

   size_sum <- size_sum %>% slice(1:10)

   print(size_sum)
}


