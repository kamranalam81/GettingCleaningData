README
About This Repository

This repositary is a course project for Coursera online course: Getting and Cleaning Data. This project uses the Human Activity Recognition Using Smartphones Data Set from UCI Machine Learning Repository. This dataset is originally collected in this study. The programming language used in this repository is R.

Files

tidy_data.txt

The cleaned dataset requested by the course project, containing 10299 observations of 68 variables. The column names are very long so the best way to read the data is probably to read it in R with the following command:

data <- read.csv("tidy_data.txt", header=TRUE, sep="\t")
It may be a little confusing that I did not save it as a csv file directly. The reason is that txt files are supported as an attachment on Coursera but csv files are not.

run_analysis.R

The R script requested by the course project. Assuming you have the dataset downloaded and unzipped in your working directory, you can get the tidy data output (tidy_data.txt) once you run this script in R.

Codebook.md

A text file that described what does the data in tidy_data.txt mean in detail.

Notes

I would like to thank out community TA David Hood (and other TAs also) for their quick and detailed response to our questions on the coursera forum.