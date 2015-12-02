# RSQLite.r
#
###########################################################
# This is a tutoorial on using SQLite database manager    #
# R.                                                      #
###########################################################

rm( list=ls() )                     # Garbage collection

###########################################################
# Delete existing database (if it exists)                 #
###########################################################

unlink("UTA.sqlite")            


install.packages( "sqldf" )        # Needed to access    

###########################################################
# We make SQLite functionality to R.                      #
###########################################################

library( sqldf )                   

##########################################################
# We create a new database named UTA in the R project.   #
##########################################################

db <- dbConnect(SQLite(), "UTA.sqlite")
        

##########################################################
# We are going to create a Course table used to hold     #
# course catalog descriptions                            #
##########################################################

query <- "CREATE TABLE 
    Department
(
    DepartmentId Primary Key,
    Name NOT NULL   
);"
    
dbSendQuery(  con=db,
              query )
dbListTables( con=db )







