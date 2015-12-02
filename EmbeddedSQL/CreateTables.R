# DefineDatabase.r

rm( list=ls())                 # Clear environment

##########################################################
# String constant contains Database file name.           #                                     #
##########################################################

DB <- "UTA.sqlite"

#########################################################
# If database exists delete file from system so we can  #
# recreate database,                                    #
#########################################################
dbExists <- file.exists( DB ) 

if( dbExists )unlink( DB )

##########################################################
# Load RSQLite database interface softwqare,             #
##########################################################

require( RSQLite)

library(RSQLite)    

####################################################

connection <- dbConnect( SQLite(), "UTA.sqlite" )

dbSendQuery( connection,
       "Create Table Student
       (  studenID integer Primary Key,
          LastName  varchar(64) NOT NULL,
          FirstName varchar(32) NOT NULL);")

dbListTables( connection )

dbSendQuery( connection,
             "Insert into Student( LastName, FirstName)
                           Values( 'Smith', 'John');" )

dbSendQuery( connection,
             "Insert into Student( LastName, FirstName)
             Values( 'Clingam', 'Ginny');" )

dbListFields(connection, "Student")

Students <- dbReadTable( connection,
                         "Student")
Students

dbDisconnect( connection )
