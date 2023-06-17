
size_summary <- function(){

    size_sum <- google_playstore %>%
        filter(!grepl("Varies with device",Size, ignore.case = TRUE)) %>%
        filter(!grepl("NA",Size, ignore.case = TRUE)) %>%
        mutate(Size = gsub("M", "000000", Size)) %>%
        mutate(Size = gsub("k", "000", Size)) %>%
        mutate(Size = as.numeric(Size)) %>%
        group_by(Category) %>%
        summarise(avg_Size = mean(Size),
                  min_Size = min(Size),
                  max_Size = max(Size)) %>%
        arrange(desc(avg_Size))

print(size_sum)

}
size_summary()


