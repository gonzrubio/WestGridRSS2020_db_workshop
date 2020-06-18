#!/usr/bin/python
import pymysql #pip install PyMySQL
import os
print("User:", os.environ['USER'])

user = os.environ['USER']

# Name of database to be accessed
database = "alopes_db";

# Get connection specs from your .my.cnf file
my_cnf = "/home/%s/.my.cnf" % user

db = pymysql.connect(db=database,read_default_file=my_cnf)    

# prepare a cursor object using cursor() method
cur = db.cursor()

# Use all the SQL you like
cur.execute("select city, population from canada_city where population > 100000 order by population desc")

# print all the first cell of all the rows
for row in cur.fetchall():
    print("City: ", row[0], " - Population:", row[1])
db.close()
