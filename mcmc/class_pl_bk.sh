#!/bin/sh

source /appl/intel/oneapi/setvars.sh
source /appl/intel/oneapi/mpi/2021.2.0/env/vars.sh
source /appl/intel/oneapi/compiler/latest/env/vars.sh intel64
source /appl/intel/oneapi/mpi/latest/env/vars.sh intel64
export I_MPI_F90=ifort

##test mpirun
mpirun -n 2 python -c "from mpi4py import MPI, __version__; print(__version__ if MPI.COMM_WORLD.Get_rank() else '')"

##real code
mpirun -n 4 --map-by socket:PE=16 cobaya-run setting_class_pl_bk.yaml -p /home/jwpark/comodata -o chains/class_pl_bk -r

wait

