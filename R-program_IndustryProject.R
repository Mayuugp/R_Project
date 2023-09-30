
library("RMySQL")
connection <- dbConnect(MySQL(),
                        username="root",
                        password=" ",
                        port= 3306,
                        dbname="Industry")

dbListTables(connection)

dbListFields(connection,"customer")

data1<- dbGetQuery(connection,"select * from customer")
View(data1)

sq<- dbSendQuery(connection,"select * from customer")
sq
data <- fetch(sq,n=2)
View(data)

# Create (INSERT) a new data in customer
query <- "INSERT INTO customer (Id, FirstName, LastName, City, Country, Phone) 
          VALUES (85,'Vikrant', 'Suryawanshi',  'Banaras', 'India', '8793986532')"
dbSendQuery(connection , query)

# Read (SELECT) all Table
query1 <- "select * from customer"
read <- dbGetQuery(connection, query1)
print(read)

# Update (UPDATE) a FirstName
query2 <- "UPDATE customer SET FirstName = 'Kunal'  WHERE Id = 8"
dbSendQuery(connection, query2)

# Read (SELECT) the updated data
read <- "SELECT * FROM customer WHERE FirstName = 'ann'"
updated_data <- dbGetQuery(connection, read)
print(updated_data)

# Delete (DELETE) a Industry
del <- "DELETE FROM customer WHERE FirstName = 'Vikrant'"
dbSendQuery(connection, del)

query <- "SELECT * FROM customer"
show <- dbGetQuery(connection, query)
print(show)

# Close the database connection
dbDisconnect(connection)
print("Connection close successfully")