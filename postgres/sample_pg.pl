#!/usr/bin/perl
use strict;
use warnings;
 
#-- Perl script that uses the "psql" client utility to
#-- execute an SQL command

#-- Name of the database involved
my $database = $ARGV[0];
if (not defined $database)
{
  print "**Error: missing database name argument\n";
  print "  I quit!\n";
  exit;
}

#-- SQL command
my $qry = 'select city,population from canada_city where population>100000 order by population desc';

#-- Open the "psql" client utility with the -B option to return
#-- results in batch tab-delimited format

#my $command = "mysql -B -D ${database} -e '${qry}'";
my $command = "psql -t -AF \$'\t' -c '${qry}'";

my $line;
my @row;
my @fields;

print "Query result\n";
print '-'x50,"\n";

open(COMM,"${command}|");
while ($line=<COMM>)
{
  chop $line;
  {
    @row = split(/\t/,$line);
    print "Row: @row","\n";
  }
}
close(COMM);

exit;

