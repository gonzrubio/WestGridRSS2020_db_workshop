#!/usr/bin/perl
use strict;
use warnings;
use DBI;

#-- User id involved
my $user = $ARGV[0];
if (not defined $user)
{
  print "**Error: missing user id argument\n";
  print "  I quit!\n";
  exit;
}
 
#-- Name of the database involved
my $database = $ARGV[1];
if (not defined $database)
{
  print "**Error: missing database name argument\n";
  print "  I quit!\n";
  exit;
}

# Get connection specs from your .my.cnf file
my $my_cnf = "/home/${user}/.my.cnf";

my $dsn =
  "DBI:mysql:${database};" . 
  "mysql_read_default_file=$my_cnf";

#my $dbh = DBI->connect('DBI:mysql:mytablename, 'mydbuser', 'dbpassword'
#      ) || die "Could not connect to database: $DBI::errstr";

my $dbh = DBI->connect(
    $dsn, 
    undef, 
    undef, 
    {RaiseError => 1}
) or  die "DBI::errstr: $DBI::errstr";

#**************************************
# select from a MySQL database from Perl
# the query must first be prepared before
# a selection may be executed.
#**************************************

my $qry = "select city,population from canada_city where population>100000 order by population desc";
my $sqlexe = $dbh->prepare($qry);
$sqlexe->execute
or die "SQL Error: $DBI::errstr\n";

#***************************************
# Now that the selection has been performed
# we can access the rows using fetchrow_array
# which will access the next available row
#***************************************

my @row;
while (@row = $sqlexe->fetchrow_array){
print "@row\n";
}

#**************************************
# Close connection from MySQL database
#**************************************

$dbh->disconnect();

