## Installing the proper packages

install.packages("tidyverse")
library(tidyverse)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

## Upload the CSV's to R

daily_activity <- read.csv("dailyActivity_merged.csv")

weight_info <- read.csv("weightLogInfo_merged.csv")

## Explore the few key tables

head(daily_activity)

colnames(daily_activity)

head(weight_info)

colnames(weight_info)

n_distinct(daily_activity$Id)
n_distinct(weight_info$Id)

nrow(daily_activity)
nrow(weight_info)

daily_activity %>%
  select(TotalSteps,
         TotalDistance,
         Calories) %>%
  summary()

weight_info %>%
  select(WeightPounds,
         BMI) %>%
  summary()


ggplot(data=daily_activity, aes(x=TotalSteps, y=Calories))+
  geom_point()+
  labs(title="Total Steps vs Calories")

ggplot(data=weight_info, aes(x=WeightPounds,y=BMI))+
  geom_point()+
  labs(title="WeightPounds vs BMI")

combined_data <- merge(weight_info, daily_activity, by="Id")

n_distinct(combined_data$Id)

ggplot(data=combined_data, aes(x=TotalSteps, y=WeightPounds))+
  geom_point()+
  labs(title="Total Steps vs WeightPounds")


