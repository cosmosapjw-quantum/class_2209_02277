#!/bin/sh

##test mpirun
mpirun -n 2 python -c "from mpi4py import MPI, __version__; print(__version__ if MPI.COMM_WORLD.Get_rank() else '')"

##real code
mpirun -n 4 --map-by socket:PE=16 cobaya-run setting_class_pl_bk.yaml -p /home/jwpark/comodata -o chains/class_pl_bk -r
mpirun -n 4 --map-by socket:PE=16 cobaya-run setting_class_pl_bk.yaml -p /home/jwpark/comodata -o chains/class_pl_bk -r
mpirun -n 4 --map-by socket:PE=16 cobaya-run setting_class_pl_bk.yaml -p /home/jwpark/comodata -o chains/class_pl_bk -r
mpirun -n 4 --map-by socket:PE=16 cobaya-run setting_class_pl_bk.yaml -p /home/jwpark/comodata -o chains/class_pl_bk -r

wait

