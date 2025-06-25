# Hapnest Simulator

This Julia package, *Hapnest Simulator (HapSim)*, enables generation of large-scale and realistic Human datasets for genotypes and phenotypes.

It implements the following functions from [synthetic_data](https://github.com/intervene-EU-H2020/synthetic_data) ([Wharrie et al.](https://academic.oup.com/bioinformatics/article/39/9/btad535/7255913)):

- fetch: to download 1KG+HGDP [reference datasets](https://gnomad.broadinstitute.org/downloads)
- generate_geno: to generate synthetic Human genotypes
- generate_pheno: to generate synthetic Human phenotypes




## Required dependencies
To use HapSim you need to install in your environment:

- plink
- plink2
- king
- vcftools
- mapthin
- phenoalg

For the comprehensive tool list please check [here](https://github.com/intervene-EU-H2020/synthetic_data/blob/main/Dockerfile).

## Quickstart tutorial

1. Activate package and download the reference data:

``` 
include("HapSim.jl")
HapSim.fetch("/data/")

``` 

2. Generate Human genotypes with parameters described within `docs/config.yaml`, using a thread number defined with ```threads``` argument:
   
``` 
HapSim.run_geno("threads","docs/config.yaml")

``` 
3. Generate Human phenotypes with parameters described within `docs/config.yaml`

``` 
HapSim.run_pheno("docs/config.yaml")

``` 



To customise your synthetic datasets, and then the [configuration file](https://github.com/intervene-EU-H2020/synthetic_data/blob/main/config.yaml), please follow details at https://github.com/intervene-EU-H2020/synthetic_data.
