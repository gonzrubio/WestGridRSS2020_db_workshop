#!/bin/bash
#SBATCH --time=00:01:00
#SBATCH --job-name=test_pg
#SBATCH --output=%x-%j.out
source venv/bin/activate
python sample_mysql.py > output.txt
