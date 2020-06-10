#!/usr/bin/python
# -*- coding: utf-8 -*-
 
import psycopg2
import sys
 
 
con = None

import os
print(os.environ['USER'])

user = os.environ['USER']
database = "%s_db" % user

print("user:" + user)
print("database:" + database)
 
try:
    con = psycopg2.connect("host='cedar-pgsql-vm.int.cedar.computecanada.ca' dbname='" + database + "' user='" + user + "'")   
    cur = con.cursor()
    cur.execute("select city,population from canada_city where population>100000 order by population desc")
 
    while True:
        row = cur.fetchone()
 
        if row == None:
            break
 
        print("City: " + row[0] + "\t\tPopulation: " + str(row[1]))
 
except psycopg2.DatabaseError, e:
    if con:
        con.rollback()
 
    print 'Error %s' % e    
    sys.exit(1)
 
finally:   
    if con:
        con.close()
