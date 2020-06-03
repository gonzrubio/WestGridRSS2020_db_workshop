#!/bin/bash
#SBATCH --account=ubcss19b-wa_cpu
#SBATCH --reservation=ubcss19b-wr_cpu
#SBATCH --time=00:01:00
#SBATCH --job-name=test_pg
#SBATCH --output=%x-%j.out
psql < canada-city.psql
