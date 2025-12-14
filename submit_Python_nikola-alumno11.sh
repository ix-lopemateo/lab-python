#!/bin/bash
#SBATCH -p hpc-bio-nikola-cpu
#SBATCH --chdir=/home/alumno11/LAB_4/lab_python
#SBATCH -J Python-HPC-Lab4-Numba
#SBATCH --cpus-per-task=1
#SBATCH --output=python_lab4_numba_%j.out
#SBATCH --error=python_lab4_numba_%j.err

# Cargar Anaconda (incluye numpy y numba)
module load anaconda/2025.06

echo "Ejecutando en nodo: $(hostname)"
echo "Fecha y hora: $(date)"
echo ""

# Número de elementos desde línea de comandos
if [ -z "$1" ]; then
    ELEMENTS=10000000   # valor por defecto razonable
else
    ELEMENTS=$1
fi

echo "Número de elementos: $ELEMENTS"
echo ""

# IMPORTANTE:
# El notebook debe estar preparado para ejecutarse como script
# (sin %timeit y leyendo sys.argv)
ipython reduc-operation-alumno11.ipynb $ELEMENTS

echo ""
echo "Ejecución completada: $(date)"
echo ""

module unload anaconda/2025.06

