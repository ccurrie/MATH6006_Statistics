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

# Plot a Weibull distribution
ggplot() +
  xlim(0, 5) +
stat_function(fun = dweibull, args = list(shape = 1.5, scale = 2), 
              aes(color = "Shape = 1.5"), linewidth = 1) +
  stat_function(fun = dweibull, args = list(shape = 0.5, scale = 2), 
                aes(color = "Shape = 0.5"), linewidth = 1) +
  stat_function(fun = dweibull, args = list(shape = 4, scale = 2), 
                aes(color = "Shape = 4.0"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Shape = 1.5" = "orange", 
                                "Shape = 0.5" = "blue", 
                                "Shape = 4.0" = "turquoise")) +
  labs(title = "Weibull Distribution",
       x = "Values",
       y = "Density",
       color = "Shape Parameter")

# Plot an Exponential distribution
ggplot() +
  xlim(0, 5) +
  stat_function(fun = dexp, args = list(rate = 0.5), 
                aes(color = "Rate = 0.5"), linewidth = 1) +
  stat_function(fun = dexp, args = list(rate = 1.0), 
                aes(color = "Rate = 1.0"), linewidth = 1) +
  stat_function(fun = dexp, args = list(rate = 4), 
                aes(color = "Rate = 4.0"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Rate = 0.5" = "orange", 
                                "Rate = 1.0" = "blue", 
                                "Rate = 4.0" = "turquoise")) +
  labs(title = "Exponential Distribution",
       x = "Values",
       y = "Density",
       color = "Rate Parameter")

# Plot a Gamma distribution
ggplot() +
  xlim(0, 5) +
  stat_function(fun = dgamma, args = list(shape = 1.0, rate = 2), 
                aes(color = "Shape = 1.0"), linewidth = 1) +
  stat_function(fun = dgamma, args = list(shape = 1.5, rate = 2), 
                aes(color = "Shape = 1.5"), linewidth = 1) +
  stat_function(fun = dgamma, args = list(shape = 4, rate = 2), 
                aes(color = "Shape = 4.0"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Shape = 1.0" = "orange", 
                                "Shape = 1.5" = "blue", 
                                "Shape = 4.0" = "turquoise")) +
  labs(title = "Gamma Distribution",
       x = "Values",
       y = "Density",
       color = "Shape Parameter")

# Plot a Lognormal distribution
ggplot() +
  xlim(0, 5) +
  stat_function(fun = dlnorm, args = list(meanlog = 0.0, sdlog = 2), 
                aes(color = "Mean = 0, SD = 2"), linewidth = 1) +
  stat_function(fun = dlnorm, args = list(meanlog = 2.0, sdlog = 2), 
                aes(color = "Mean = 2, SD = 2"), linewidth = 1) +
  stat_function(fun = dlnorm, args = list(meanlog = 0.0, sdlog = 5), 
                aes(color = "Mean = 0, SD = 5"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Mean = 0, SD = 2" = "orange", 
                                "Mean = 2, SD = 2" = "blue", 
                                "Mean = 0, SD = 5" = "turquoise")) +
  labs(title = "Lognormal Distribution",
       x = "Values",
       y = "Density",
       color = "Parameters")

# Plot a chi-squared distribution
ggplot() +
  xlim(0, 20) +
  stat_function(fun = dchisq, args = list(df = 1), 
                aes(color = "Degrees of Freedom = 1"), linewidth = 1) +
  stat_function(fun = dchisq, args = list(df = 5), 
                aes(color = "Degrees of Freedom = 5"), linewidth = 1) +
  stat_function(fun = dchisq, args = list(df = 10), 
                aes(color = "Degrees of Freedom = 10"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Degrees of Freedom = 1" = "orange", 
                                "Degrees of Freedom = 5" = "blue", 
                                "Degrees of Freedom = 10" = "turquoise")) +
  labs(title = "Chi-Squared Distribution",
       x = "Values",
       y = "Density",
       color = "Degrees of freedom")

# Plot a Student-t distribution
ggplot() +
  xlim(0, 10) +
  stat_function(fun = dt, args = list(df = 1), 
                aes(color = "Degrees of Freedom = 1"), linewidth = 1) +
  stat_function(fun = dt, args = list(df = 2), 
                aes(color = "Degrees of Freedom = 2"), linewidth = 1) +
  stat_function(fun = dt, args = list(df = 10), 
                aes(color = "Degrees of Freedom = 10"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Degrees of Freedom = 1" = "orange", 
                                "Degrees of Freedom = 2" = "blue", 
                                "Degrees of Freedom = 10" = "turquoise")) +
  labs(title = "Student t Distribution",
       x = "Values",
       y = "Density",
       color = "Degrees of freedom")

# Plot a F distribution
ggplot() +
  xlim(0, 20) +
  stat_function(fun = stats::df, args = list(df1 = 1, df2 = 1), 
                aes(color = "Degrees of Freedom = 1 and 1"), linewidth = 1) +
  stat_function(fun = stats::df, args = list(df1 = 5, df2 = 15), 
                aes(color = "Degrees of Freedom = 5 and 15"), linewidth = 1) +
  stat_function(fun = stats::df, args = list(df1 = 100, df2 = 100), 
                aes(color = "Degrees of Freedom = 100 and 100"), linewidth = 1) +
  # Match the exact labels used above to their respective colors
  scale_color_manual(values = c("Degrees of Freedom = 1 and 1" = "orange", 
                                "Degrees of Freedom = 5 and 15" = "blue", 
                                "Degrees of Freedom = 100 and 100" = "turquoise")) +
  labs(title = "F Distribution",
       x = "Values",
       y = "Density",
       color = "Degrees of freedom")

## CLT ##
n2sample <- list(values = c(30, 35, 40, 47.5, 50, 45, 50, 50, 57.5, 60, 40, 55, 55, 62.5, 65, 60, 67.5, 70, 67.5, 70, 77.5))
n6sample <- list(values =c(50.1, 51.6, 54.1, 54.1, 55.8, 57.3, 60.8))

n2sampledf <- as.data.frame(n2sample)
n6sampledf <- as.data.frame(n6sample)

ggplot(data=n2sampledf, aes(x=values)) +
  geom_histogram(
    fill = "limegreen", 
    color = "black") +
  labs(
    title = "Pocket Money Example, n = 2",
    x = "Values"
  )

ggplot(data=n6sampledf, aes(x=values)) +
  geom_histogram(
    fill = "limegreen",
    color = "black") +
  labs(
    title = "Pocket Money Example, n = 6",
    x = "Values"
  )

## Die example

# Generate 1000 replications from a standard die
replicated_array <- replicate(1000, sample(1:6, size = 1, replace = TRUE))
die_values <- as.data.frame(replicated_array)

ggplot(data=die_values, aes(x=replicated_array)) +
  geom_histogram(
    fill = "limegreen",
    color = "black") +
  labs(
    title = "Samples of a Standard Die",
    x = "Values"
  )


#Generate 1000 replications each of size 5 from a standard die
replicated_matrix <- replicate(1000, sample(1:6, size = 5, replace = TRUE))

# Calculate the mean of each of the 1000 columns
die_sample_means <- as.data.frame(colMeans(replicated_matrix))

#Draw a histogram with a normal curve superimposed
ggplot(die_sample_means, aes(x = `colMeans(replicated_matrix)`)) +
  geom_histogram(
    aes(y = after_stat(density)),
    fill = "limegreen"
  ) +
  stat_function(
    fun = dnorm,
    args = list(
      mean = mean(die_sample_means$`colMeans(replicated_matrix)`),
      sd = sd(die_sample_means$`colMeans(replicated_matrix)`)
    ),
    colour = "black",
    linewidth = 1
  ) +
  labs(
    title = "Sample means where n = 5"
    x = "Scores",
    y = "Density"
  )

