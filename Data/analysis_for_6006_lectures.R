library(ggplot2)
library(dplyr)

setwd("C:/Users/ccurrie/OneDrive - University of Southampton/Documents/Teaching/MATH6006 Stoch Proc and Stats/Statistics Section/Data")

# Read in names data
names <- readLines("names.txt")
field_name <- "last_names"
names_df <- data.frame(name = names[-1], stringsAsFactors = FALSE)
colnames(names_df) <- field_name

#Find frequencies
frequency_df <- as.data.frame(table(names_df[[1]]))
colnames(frequency_df) <- c(field_name, "Frequency")

#Draw a bar plot with lime green coloured bars
ggplot(frequency_df, aes(x=last_names, y = Frequency)) +
  geom_bar(stat="identity", fill = "limegreen") +
  labs(
    title = "Frequency of Last Names",
    x = names[1],
    y = "Frequency"
  )

# Read in computer data
computer <- readLines("computer.txt")
computer_field_name <- "Hours"
computer_df <- data.frame(computer = computer[-1])
colnames(computer_df)<- computer_field_name
computer_df$Hours <- as.double(computer_df$Hours)

#Draw Histogram
ggplot(computer_df, aes(x=Hours)) +
  geom_histogram(
    bins=12,
    fill ="orange"
  ) +
  labs(
    title = "Histogram of hours spent on a computer",
    x = "Hours",
    y = "Frequency"
  ) 

#Draw ECDF
ggplot(computer_df, aes(x=Hours)) +
  stat_ecdf() +
  labs(
    title = "Cumulative Distribution Function of Hours",
    x="Hours",
    y= "Cumulative Probability"
  )
  
#Read in equipment store data
equipment_df <- read.table(
  "store.txt",
  header = TRUE,
  sep = "\t"
)

#Draw scatterplot`
ggplot(equipment_df, aes(x=`No..of.Commercials`, y=`Sales.Volume`)) +
  geom_point()  +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Commercials vs Sales Volume",
    x = "Number of Commercials",
    y = "Sales Volume"
  )

#Read in waiting times data
waiting_df <- read.table(
  "WaitingTime.txt",
  header = TRUE,
  sep = "\t"
)

#Draw boxplot
ggplot(waiting_df, aes(y=Waiting.Time)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Waiting Times",
    y = "Waiting Time"
  )

#Draw a histogram with a normal curve superimposed
ggplot(waiting_df, aes(x = Waiting.Time)) +
  geom_histogram(
    aes(y = after_stat(density)),
    bins = 13,
    fill = "limegreen",
  ) +
  stat_function(
    fun = dnorm,
    args = list(
      mean = mean(waiting_df$Waiting.Time),
      sd = sd(waiting_df$Waiting.Time)
    ),
    colour = "blue",
    linewidth = 1
  ) +
  labs(
    x = "Waiting times",
    y = "Density"
  )
