# Introduction to Statistics

There are two main areas of statistics: 

* *Mathematical statistics* develops and proves statistical theorems, rules and laws.
* *Applied statistics* uses these to solve real-world problems. 
We will be dealing mainly with applied statistics, which can be split into two main areas: descriptive statistics and inferential statistics.

* *Descriptive statistics* consists of methods for organizing, displaying and describing
data by using tables, graphs and summary measures (mean, mode, median, etc).
* *Inferential statistics* consists of methods that use sample results to make decisions about a population.

## Data: Elements, variables and observations

The starting point for statistical analysis is data. The word `data' is the plural of `datum', which means a
piece of information. All the data collected in a particular study are referred to as a *data set*.
*Elements* are entities on which data are collected. A *variable* is a characteristic of
interest for the elements. The result of a measurement obtained for a particular element
is called an *observed value* or *observation*. Measurements collected on each variable
for every element in a study give a data set. For example, in the data set of Table~\ref{Tab:TwoStudents},
the two elements are 'David' and 'Mary'; the variables are 'Exam 1', 'Exam 2', 'Exam 3' and 'Grade'. For the Exam variables, the observations are *numerical*; and for the Grade variable, the observations are  *categorical*.

\begin{table}[h]
	\caption{Data for Two Students} \label{Tab:TwoStudents}
	\begin{center} \tabcolsep=20pt
		\begin{tabular}{|c|ccc|l|} \hline
			& \multicolumn{3}{|c|}{Exam} & \\ \hline
			Name    & 1 & 2 & 3 & {\bf Grade}  \\ \hline
			David   & 90 & 95 & 92  & A+ \\
			Mary    & 85 & 90 & 91  & A \\ \hline
		\end{tabular}
	\end{center}
\end{table}

We will see later how to summarise a data set and how to measure relationships between variables.

## Qualitative and quantitative data

There are two common types of data: *qualitative or categorical data* include labels or names used to
identify an attribute of each element. *Quantitative data* require numerical values that indicate how
much or how many, and can be discrete (number of houses, cars, etc) or continuous (height, weight, etc).
A *qualitative variable* is a variable with qualitative data, and a *quantitative variable* is a
variable with quantitative data. An appropriate statistical analysis depends upon whether the variable is
quantitative or qualitative. The statistical analysis for qualitative data is rather limited. We can determine
frequencies, relative frequencies and represent these using a bar graph and pie chart. There are more alternatives
for statistical analysis of quantitative data.

## Cross-sectional and time series data
*Cross-sectional data* are data collected on different elements at approximately the same point in time.
*Time series data* are data collected over several time periods on the same element(s).

## Data sources
Data can be obtained from existing sources, surveys, census, and statistical studies
designed to collect new data. Many situations require data for a large group of elements (individuals, companies, voters, households, products,
customers, etc.) Because of time, costs or some other reasons, often data are collected from only a small portion
of the group. The group of all elements of interest in a particular study is called the *population* and the
smaller group of the population selected for the study is called the *sample*. A *census* is the
process of conducting a survey to collect data of the entire population, and the process of conducting a survey
to collect data from a sample is called a *sample survey*. The methods of statistical inference use sample
results to make estimates or tests hypothesis about the characteristics of a population.


We will start with defining some descriptive statistics that are typically collected as part of an *exploratory data analysis* and can detect ``global'' features of data such as shape, peaks and outliers. We will then move on to more concrete distributions of data and introduce inferential 
statistics.
