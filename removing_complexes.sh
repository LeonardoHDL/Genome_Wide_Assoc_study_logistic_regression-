#bin/bash!


#This module is meant to remove genomic complexes from the human genomic structure
#these modules can alter results in a assoc study or in a PCA


#for the first step we are creating a specific directory to place all the new outputfiles from 
#the first QC which is removing high ld or MHC complexes zones reported in:
#   https://genome.sph.umich.edu/wiki/Regions_of_high_linkage_disequilibrium_(LD)
mkdir ${outdirectory}${todays_date}_QC_for_pca
mkdir ${outdirectory}${todays_date}_QC_for_pca/Removed_complexes

#directory where this process will be stored
directory_for_hild_prunning=${outdirectory}${todays_date}_QC_for_pca/Removed_complexes/

#Output file from the first plink step below
set_of_high_ld_regions=${directory_for_hild_prunning}hild_set

#You can download this file in the link reported above
reported_high_ld_zones_file=${path_to_extrafiles}high_ld_regions.txt
output_file_removed_high_ld_regions=${outdirectory}${todays_date}_QC_for_pca/Removed_complexes/${todays_date}_removed_hild_complexes

echo "data to be used as the input for the removal of high LD complexes is:"
echo ${input_file}

#we must first remove the high linkage disequilibrium regions such as those that contains MHC complexes
module load plink/1.9
plink --bfile ${input_file} --make-set ${reported_high_ld_zones_file} --autosome --write-set  --keep-allele-order --out ${set_of_high_ld_regions}
plink --bfile ${input_file} --exclude ${set_of_high_ld_regions}.set --autosome --keep-allele-order --make-bed --out ${output_file_removed_high_ld_regions}
module unload plink/1.9

echo "Completed the removal of High LD complexes, the output file is:"
echo ${output_file_removed_high_ld_regions}