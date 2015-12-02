# RSQLite.r

rm( list=ls())

library(RSQLite)    

db <- dbConnect(SQLite(), "UTA.sqlite")
        

##########################################################
# We are going to create a Course table used to hold     #
# course catalog descriptions                            #
##########################################################

query <- 
"CREATE TABLE 
    Department
(
    DepartmentId integer      Primary Key,
    name         varchar(128) NOT NULL UNIQUE
           );"

dbSendQuery(  con=db,
              query )
dbListTables( con=db )

query <- 
    "Insert into Department( name )
            Values( 'Mathematics' ),
                  ( 'College of Business Administration' ),
                  ( 'Accounting' ),
                  ( 'Business Administration' ),
                  ( 'Economics' ),
                  ( 'Information Sysytems and Operations Management' ),
                  ( 'Management' ),
                  ( 'Marketing' );"

###########################################################
# Send the query to the database for execution.           #
###########################################################

dbSendQuery( con=db,
             query )

###########################################################
# Read entire table into an R data frame named Deaprtment #
# and print auto print data frame.                        #
##########################################################

Department <-dbReadTable(db, "Department" )
Department

##########################################################
# Create subject table used for course prefixes. These   #
# may or may not be the same name as the department      #
# prefix.                                                #
##########################################################

query <-
    "CREATE TABLE Subject
    (
        subjectID     integer Primary Key,
        prefix       char(5) NOT NULL UNIQUE,
        description  CHAR(64) NOT NULL,
        departmentID INTEGER NOT NULL 
            REFERENCES Department( departmentID )
    );"

###########################################################
# Send CREATE Statement to database.                      #
###########################################################

###########################################################
# Free up shared resources by disconnection form the      #
# database.  This is very important in the shared         #
# database environment.                                   #
###########################################################

dbDisconnect( con=db )







