#!/usr/bin/env bash


#this script will remove LD regions from the data to be used in PCA
#This script must be run after the removal of High LD and other complex regions from the genomic structure


#we must first define the variables that will be used in this script
#we also have to create a new folder to store the results of this step
mkdir ${outdirectory}${todays_date}_QC_for_pca/${todays_date}_LD_pruning_for_pca

#Output file from the QC step perfomed in QC_for_PCA.sh
input_for_LD_pruning=${outdirectory}${todays_date}_QC_for_pca/${todays_date}_generalQC/${todays_date}_output_from_QC

#Where the output from this step will be stored
output_for_LD_pruning=${outdirectory}${todays_date}_QC_for_pca/${todays_date}_LD_pruning_for_pca/${todays_date}_output_from_LD_pruning

#Output file from the first plink step below
set_of_snps_to_prune=${outdirectory}${todays_date}_QC_for_pca/${todays_date}_LD_pruning_for_pca/${todays_date}_set_of_snps_to_prune

#now we will use plink to remove LD regions from the data
echo "removing LD regions from ${input_for_LD_pruning}"
module load plink/1.9
plink --bfile ${input_for_LD_pruning} --indep-pairwise 50 5 0.5 -keep-allele-order --out ${set_of_snps_to_prune}
plink --bfile ${input_for_LD_pruning} --extract ${set_of_snps_to_prune}.prune.in --keep-allele-order --make-bed --out ${output_for_LD_pruning}
module unload plink /1.9
echo "LD prunning for PCA completed, results are in ${output_for_LD_pruning}"
