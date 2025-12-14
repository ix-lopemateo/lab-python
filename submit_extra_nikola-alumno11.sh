#!/bin/bash
#SBATCH -p hpc-bio-nikola-cpu
#SBATCH --chdir=/home/alumno11/LAB_4/lab_python
#SBATCH -J Pi-MonteCarlo
#SBATCH --cpus-per-task=1
#SBATCH --output=pi_output_%j.out

module load anaconda/2025.06

echo "Ejecutando cálculo de π con Monte Carlo"
echo "Nodo: $(hostname)"
echo "Fecha: $(date)"
echo ""

# Ejecutar con 100 millones de muestras
ipython pi-solution-alumno11.ipynb 100000000

echo ""
echo "Completado: $(date)"

module unload anaconda/2025.06

