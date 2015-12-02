# Advanced R-database programming I

##########################################################
# Clear the R-ennvironment, that us remove all objects   #
# from memory.                                           #
##########################################################
#
rm( list=ls())
#
#
##########################################################
# We are going to use the Chinook database in the my     #
# Databases table.  The character variable below points  #
# to the Chinook database.                               #
##########################################################
#
DB <- "C:/Users/Craig/Databases/Chinook.sqlite"
#
#
#########################################################
# We need to load the RSQLite software from the library #
# and the database interface software.                  #
########################################### Advanced R-database programming I

##########################################################
# Clear the R-ennvironment, that us remove all objects   #
# from memory.                                           #
##########################################################
#
rm( list=ls())
#
#
##########################################################
# We are going to use the Chinook database in the my     #
# Databases table.  The character variable below points  #
# to the Chinook database.                               #
##########################################################
#
DB <- "C:/Users/Craig/Databases/Chinook.sqlite"
#
#
#########################################################
# We need to load the RSQLite software from the library #
# and the database interface software.                  #
#########################################################
#
loaded <- require( RSQLite )
#
#
#########################################################
# Now we can connect to the actual database.            #
#########################################################
#
db <- dbConnect( SQLite(), DB)
#
#
########################################################
# We can get all the results at once by using the      #
# dbGetGuery function.                                 #
########################################################
#
resultSet <-
    dbSendQuery( db,
        "SELECT * 
        FROM Artist" 
        )
#
#
###########################################################
# We will now loop throgh the reult set one row at a time #
# displaying each row in turn,                            #
###########################################################
#
while (!dbHasCompleted( resultSet )) {
    Artist <- dbFetch( resultSet , 1 )
    print( Artist )
}
#
#
###########################################################
# Close resultset to free DBMS resources.                 #
###########################################################
#
dbClearResult( resultSet ) 
#
#
###########################################################
# Close database connection to free more DBMS sgared      #
# resources.                                              #
###########################################################
#
dbDisconnect( db )###############
#
loaded <- require( RSQLite )
#
#
#########################################################
# Now we can connect to the actual database.            #
#########################################################
#
db <- dbConnect( SQLite(), DB)
#
#
########################################################
# We can get all the results at once by using the      #
# dbGetGuery function.                                 #
########################################################
#
resultSet <-
    dbSendQuery( db,
        "SELECT * 
        FROM Artist" 
        )
#
#
###########################################################
# We will now loop throgh the reult set one row at a time #
# displaying each row in turn,                            #
###########################################################
#
while (!dbHasCompleted( resultSet )) {
    Artist <- dbFetch( resultSet , 1 )
    print( Artist )
}
#
#
###########################################################
# Close resultset to free DBMS resources.                 #
###########################################################
#
dbClearResult( resultSet ) 
#
#
###########################################################
# Close database connection to free more DBMS sgared      #
# resources.                                              #
###########################################################
#
dbDisconnect( db )