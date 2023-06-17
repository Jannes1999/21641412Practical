ICU <- function(){
    # Calculate the increase in units used for each region


     Increased_hospital_beds <- Covid1 %>%
        group_by(location) %>%
        mutate(hospital_beds_per_thousand_increase = hospital_beds_per_thousand - lag(hospital_beds_per_thousand)) %>%
        filter(location, date, hospital_beds_per_thousand_increase)

    # Find the three regions with the highest increase
    highest_increase <- Increased_hospital_beds %>%
        group_by(location) %>%
        summarize(total_increase = sum(hospital_beds_per_thousand_increase, na.rm = TRUE)) %>%
        top_n(3, total_increase) %>%
        arrange(desc(total_increase))

    # Find the three regions with the lowest increase
    lowest_increase <- Increased_hospital_beds %>%
        group_by(location) %>%
        summarize(total_increase = sum(hospital_beds_per_thousand_increase, na.rm = TRUE)) %>%
        top_n(3, -total_increase) %>%
        arrange(total_increase)

    print(highest_increase$location)

    Increased_hospital_beds <- Covid1 %>%
        group_by(location) %>%
        mutate(hospital_beds_per_thousand_increase = hospital_beds_per_thousand - lag(hospital_beds_per_thousand))
    Increased_hospital_beds

    }





