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

#Sample data from three different binomial distributions and include on the same plot

# Sample binomial data
n_trials <- 100
sample_size <- 1000
sim_data_1 <- rbinom(n=sample_size, size = n_trials, prob = 0.1)
sim_data_2 <- rbinom(n=sample_size, size = n_trials, prob = 0.5)
sim_data_3 <- rbinom(n=sample_size, size = n_trials, prob = 0.8)
sim_df <- data.frame(successes = c(sim_data_1, sim_data_2, sim_data_3),
                     distribution = rep(c("p = 0.1", "p = 0.5", "p = 0.8"),
                                        each = sample_size))

# Plot the data on a histogram
ggplot(sim_df, aes(x=successes, fill = distribution)) +
  geom_histogram(binwidth = 1,
                 center = 0) +
  scale_fill_manual(values = c("p = 0.1" = "limegreen", "p = 0.5" = "tomato", "p = 0.8" = "royalblue")) +
  labs(title = "Comparison of Binomial Distributions",
       x = "Number of Successes",
       y = "Frequency",
       fill = "Probability (p)")

# Sample hypergeometric data
N_pop <- 200
n_sample <- 20
sample_size <- 1000
hg_sim_data_1 <- rhyper(nn = sample_size, m = 30, n = N_pop - 30, k = n_sample)
hg_sim_data_2 <- rhyper(nn = sample_size, m = 170, n = N_pop - 170, k = n_sample)

sim_df <- data.frame(successes = c(hg_sim_data_1, hg_sim_data_2),
                     distribution = rep(c("m = 30", "m = 170"),
                                        each = sample_size))

# Plot the data on a histogram
ggplot(sim_df, aes(x=successes, fill = distribution)) +
  geom_histogram(binwidth = 1,
                 center = 0,
                 color = "white") +
  scale_fill_manual(values = c("m = 30" = "limegreen", "m = 170" = "tomato")) +
  labs(title = "Comparison of Hypergeometric Distributions",
       x = "Number of Successes",
       y = "Frequency",
       fill = "Successes in Pop (m)")


# Sample Poisson data
sample_size <- 1000
poisson_sim_data_1 <- rpois(n = sample_size, lambda = 1)
poisson_sim_data_2 <- rpois(n = sample_size, lambda = 20)
poisson_sim_data_3 <- rpois(n = sample_size, lambda = 60)


sim_df <- data.frame(successes = c(poisson_sim_data_1, poisson_sim_data_2, poisson_sim_data_3),
                     distribution = rep(c("lambda = 1", "lambda = 20", "lambda = 60"),
                                        each = sample_size))

# Plot the data on a histogram
ggplot(sim_df, aes(x=successes, fill = distribution)) +
  geom_histogram(binwidth = 1,
                 center = 0,
                 color = "white") +
  scale_fill_manual(values = c("lambda = 1" = "limegreen", "lambda = 20" = "tomato", "lambda = 60" = "royalblue")) +
  labs(title = "Comparison of Poisson Distributions",
       x = "Number of Events",
       y = "Frequency",
       fill = "lambda")


