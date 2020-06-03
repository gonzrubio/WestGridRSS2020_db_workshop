#!/bin/bash
#SBATCH --account=ubcssl9b-wa_cpu
#SBATCH --reservation=ubcss19b-wr_cpu
#SBATCH --time=00:01:00
#SBATCH --job-name=test_pg
#SBATCH --output=%x-%j.out
source perl5lib
perl sample2_mysql.pl [user] [database] > sample2_mysql.rep
