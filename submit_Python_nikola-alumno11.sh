#!/bin/bash
#SBATCH -p hpc-bio-nikola-cpu
#SBATCH --chdir=/home/alumno11/LAB_4/lab_python  
#SBATCH -J Python-HPC-Lab4
#SBATCH --cpus-per-task=1
#SBATCH --output=python_lab4_%j.out
#SBATCH --error=python_lab4_%j.err

# Cargar módulo de Anaconda
module load anaconda/2025.06

# Mostrar información del nodo
echo "Ejecutando en nodo: $(hostname)"
echo "Fecha y hora: $(date)"
echo ""

# Obtener el número de elementos del primer argumento
if [ -z "$1" ]; then
    ELEMENTS=1000000
else
    ELEMENTS=$1
fi

echo "Número de elementos: $ELEMENTS"
echo ""

# Ejecutar el notebook con ipython
# IMPORTANTE: El nombre del notebook debe coincidir
ipython reduc-operation-alumno11.ipynb $ELEMENTS  

echo ""
echo "Ejecución completada: $(date)"
echo ""

module unload anaconda/2025.06


