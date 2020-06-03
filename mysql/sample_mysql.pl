#!/usr/bin/perl
use strict;
use warnings;
 
#-- Perl script that uses the "mysql" client utility to
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

#-- Open the "mysql" client utility with the -B option to return
#-- results in batch tab-delimited format

my $command = "mysql -B -D ${database} -e '${qry}'";

my $line;
my @row;
my @fields;
my $first='y';

print "Query result\n";
print '-'x50,"\n";

open(COMM,"${command}|");
while ($line=<COMM>)
{
  chop $line;
  #-- If first line, fetch field names
  if ($first eq 'y')
  {
    $first = 'n';
    @fields = split(/\t/,$line);
    print "Fields: @fields","\n";
  }

  #-- Otherwise fetch field values
  else
  {
    @row = split(/\t/,$line);
    print "Row: @row","\n";
  }
}
close(COMM);

exit;

