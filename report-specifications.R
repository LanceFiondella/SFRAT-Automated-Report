############################### EDIT BELOW FOR SCRIPT PARAMETERS ############################### 

<<<<<<< HEAD
verbose_report <- 1		#1 for verbose report, 0 for non-verbose

#Specify the location to the input data file and specific sheet number
filePath <- '/SFRAT/model_testing/model_data.xlsx'
sheetNumber <- 1
colors <- c("navy","red","green","firebrick4","magenta")   # Specify colors to view results of each model

=======
# edit below for script parameters #
	
#subset data into parts? 1 for yes, 0 for no
#subset_data <- 0 #Uncomment lines 70-82 if this option is enabled

#1 for verbose report, 2 for non-verbose
verbose_report <- 1								

#designate location of data file
filePath <- '/SFRAT/model_testing/model_data.xlsx'
#select which sheet to pick, in this case gives SYS1
sheetNumber <- 1
colors <- c("navy","red","green","firebrick4","magenta","blue")
>>>>>>> vnagaraju14/master

#Tab 1 Parameters:
confidence_lvl <- 0.9  #Laplace test confidence level

#Tab 2 Parameters:
<<<<<<< HEAD
num_failures_future_prediction <- 2	 #Number of future failures to predict
models_to_apply <- c('DSS', 'GM', 'Wei','GO','JM') #Pick models to include, by default is all
mission_time <- 600   #Mission time to compute reliability growth
=======
	#number of future failures to predict
	num_failures_future_prediction <- 2	

	#pick models to include, by default is all
	models_to_apply <- c('DSS', 'GM', 'Wei','GO','JM','ISS')
	#mission time to compute reliability growth
	mission_time <- 600
>>>>>>> vnagaraju14/master

#Tab 3 Parameters:
num_failures_to_predict <- 3  #Number of future failures to predict
additional_time_software_will_run <- 4116  #Future prediction time
desired_reliability <- .9     #Between 0-1, desired software reliability
reliability_interval_length<- 600   #Interval size

#Tab 4 Parameters:
percent_data_for_PSSE <- .9  #Predictive sum of squares, percentage

############################### DO NOT EDIT BELOW #####################################

library("knitr")
library("markdown")
library("rmarkdown")
library("readxl")
library("formatR")
library("shiny")
library("DT")
library("gdata")
library("Rcpp")
library("ggplot2")
library("rootSolve")
library("colorspace")

datapath <- paste0(getwd(), filePath)
<<<<<<< HEAD
datasettemp <- read_excel(datapath,sheet = sheetNumber) 
SheetName<-excel_sheets(path=datapath)[sheetNumber] 
=======
datasettemp <- read_excel(datapath,sheet = sheetNumber)  #Specify the sheet with the data
SheetName<-excel_sheets(path=datapath)[sheetNumber] #Specify the sheet selected in the above line

>>>>>>> vnagaraju14/master

dataset <- datasettemp[1:floor(dim(datasettemp)[1]),]
x <- verbose_report
rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'),output_file =  paste("SFRAT report_", SheetName,'_', Sys.Date(), ".pdf", sep=''),output_dir = './Reports') 

<<<<<<< HEAD
#SUBSET DATA OPTION - FUTURE WORK

#subset data into parts? 1 for yes, 0 for no
# subset_data <- 0
# 
# 
# if (subset_data==1) {
#   ds <- readline(prompt="How many percent of data should be used in each subset? (Input should be between 0 to 1)___")
#   ds <- as.double(ds) 
#   dsi <- ds
#   while(dsi<=1){
#     dataset <- datasettemp[1:floor(dsi*dim(datasettemp)[1]),]
#     rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'),output_file =  paste("SFRAT report_", SheetName,'_',dsi,'_', Sys.Date(), ".pdf", sep=''), output_dir = './Reports') 
#     dsi=dsi+ds;
#   }
#   } else {
#   dataset <- read_excel(datapath,sheet = 1)
#   rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'), output_file =  paste("SFRAT report_", SheetName,'_', Sys.Date(), ".pdf", sep=''),output_dir = './Reports') 
#   }

=======
#if (subset_data==1) {
#  ds <- readline(prompt="How many percent of data should be used in each subset? (Input should be between 0 to 1)___")
#  ds <- as.double(ds) 
#  dsi <- ds
#  while(dsi<=1){
#    dataset <- datasettemp[1:floor(dsi*dim(datasettemp)[1]),]
#    rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'),output_file =  paste("SFRAT report_", SheetName,'_',dsi,'_', Sys.Date(), ".pdf", sep=''), output_dir = './Reports') 
#    dsi=dsi+ds;
#  }
#  } else {
#  dataset <- read_excel(datapath,sheet = 1)
#  rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'), output_file =  paste("SFRAT report_", SheetName,'_', Sys.Date(), ".pdf", sep=''),output_dir = './Reports') 
#}
>>>>>>> vnagaraju14/master
