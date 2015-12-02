# Advanced R-database programming

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
{
if( loaded )
    print( "SQLIte package loaded." )
} else {
    stop( "SQLite package not loaded.")
}
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
Artist <- dbGetQuery( db,
                      "SELECT * FROM Artist" )

########################################################
# Close connection to free up database resources. You  #
# always do this becuase you are sharing resourcews    #
# other users.                                         #
########################################################
#
RC <- dbDisconnect( db )
#
#
#######################################################
# Confirm thge database connection closed sucessfully.#
# If not display error message and stop.              #
#######################################################


#
# 
#######################################################
# Now we can display the contents of the Artist table #
# using R's autoprint feature. Here I will only print #
# the first 10 rows of the table.                     #
#######################################################
#
Artist[1:10,]

