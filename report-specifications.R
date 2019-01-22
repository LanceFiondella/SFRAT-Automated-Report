############################### EDIT BELOW FOR SCRIPT PARAMETERS ############################### 

verbose_report <- 1		#1 for verbose report, 2 for non-verbose

#Specify the location to the input data file and specific sheet number
filePath <- '/SFRAT/model_testing/model_data.xlsx'
sheetNumber <- 1
colors <- c("navy","red","green","firebrick4","magenta")   # Specify colors to view results of each model


#Tab 1 Parameters:
confidence_lvl <- 0.9  #Laplace test confidence level

#Tab 2 Parameters:
num_failures_future_prediction <- 2	 #Number of future failures to predict
models_to_apply <- c('DSS', 'GM', 'Wei','GO','JM') #Pick models to include, by default is all
mission_time <- 600   #Mission time to compute reliability growth

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
library("ggplot2")
library("rootSolve")

datapath <- paste0(getwd(), filePath)
datasettemp <- read_excel(datapath,sheet = sheetNumber) 
SheetName<-excel_sheets(path=datapath)[sheetNumber] 

dataset <- datasettemp[1:floor(dim(datasettemp)[1]),]
x <- verbose_report
rmarkdown::render(paste0(getwd(),'/SFRATReport.Rmd'),output_file =  paste("SFRAT report_", SheetName,'_', Sys.Date(), ".pdf", sep=''),output_dir = './Reports') 

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

