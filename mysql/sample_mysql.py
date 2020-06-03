#!/usr/bin/python
import MySQLdb #pip install MySQL-python

import os
print(os.environ['USER'])

user = os.environ['USER']

# Name of database to be accessed
database = "yourdb";

# Get connection specs from your .my.cnf file
my_cnf = "/home/%s/.my.cnf" % user

db = MySQLdb.connect(db=database,read_default_file=my_cnf)    

# prepare a cursor object using cursor() method
cur = db.cursor()

# Use all the SQL you like
cur.execute("select city,population from canada_city where population>10000")

# print all the first cell of all the rows
for row in cur.fetchall():
    print row[0]
db.close()
