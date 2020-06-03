#!/bin/bash
#SBATCH --account=ubcss19b-wa_cpu
#SBATCH --reservation=ubcss19b-wr_cpu
#SBATCH --time=00:01:00
#SBATCH --job-name=test_pg
#SBATCH --output=%x-%j.out

export LD_LIBRARY_PATH=/cvmfs/soft.computecanada.ca/nix/var/nix/profiles/postgresql-10.2/lib
source ~/python/bin/activate
python sample_pg.py > sample_pg.rep

