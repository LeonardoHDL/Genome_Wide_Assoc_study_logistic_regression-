# Genome_Wide_Assoc_study_logistic_regression
This repository contains the necessary scripts to perform a genome wide association study using logistic regression. 
It's to note that user only has to run the GWAS.sh script, which will call the other scripts.  
It should be run in the following way:  
./GWAS.sh  -o 'path/to/output/folder' -i 'path/to/input/file' -x 'path/to/extra/files' 
The -o argument is necessary for the pipeline to work, the -i and -x arguments are optional
User can also pass to the script the following arguments (that will define new variables and values to be used throughout the analysis):  
-------args for GWAS.sh script-------  
-o outdirectory -> inside this directory the results will be stored in separate folders, the results will be allocated  automatically in the corresponding folder
 (folders will be created automatically)  
-i input_file -> binary plink file (bfiles) to be used in the analysis  
-x extrafiles -> path to the extra files to be used in the analysis.  

it is import to note that this directory is where the extrafiles are stored, these extrafiles are:   
covar file, pheno file, clin file, R script (assoc_results_plotts.R)file to obtain Manhattan and QQ,
python scripts to plot PCA and to obtain the finals csvs containing the hits of the GWAS. (plotting_pca.py, adding_variant_info.py)
covar and pheno file are the same as those obtained in the PCA step, but you must place them here first if you want to skip PCA step.

If you don't have this directory and the mentioned files, it's neccesary to change the extrafiles directory to where this extrafiles are stored. these extrafiles are necessary for the PCA and association study.

In this directory you must also place the results of a previous PCA (eigenvec) if you want to skip PCA step in this study. You must also rename them to match the reading from python scripts as follows:
eigenvec file must be named as: covarfile.txt, and pheno file must be named as: pheno.txt if you want to skip PCA step  

-----args for QC in plink:-----------  
-g geno, -m mind, -a maf, -h hwe, -n min, -r rel_cutoff
these are numeric values that will be used in the plink command to perform the QC for association study.
if the user wants to change QC values for PCA, it's necessary to change the QC values in the PCA.sh script
  
then, the GWAS.sh script can be run as follows:  
./GWAS.sh -o outdirectory -i input_file -x extrafiles -g geno -m mind -a maf -h hwe -n min -r rel_cutoff