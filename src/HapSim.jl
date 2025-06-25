module HapSim

# Utilities
include("utils/parameter_parsing.jl")
include("utils/reference_data.jl")

# Preprocessing
include("preprocessing/utils.jl")
include("preprocessing/preprocessing.jl")

# Algorithms
include("algorithms/genotype/write_output.jl")
include("algorithms/genotype/genotype_algorithm.jl")
include("algorithms/phenotype/phenotype_algorithm.jl")

# Evaluation metrics
include("evaluation/metrics/eval_aats.jl")
include("evaluation/metrics/eval_kinship_detail.jl")
include("evaluation/metrics/eval_kinship_quick.jl")
include("evaluation/metrics/eval_ld_corr.jl")
include("evaluation/metrics/eval_ld_decay.jl")
include("evaluation/metrics/eval_maf.jl")
include("evaluation/metrics/eval_pca.jl")
include("evaluation/metrics/eval_gwas.jl")

# Evaluation pipeline
include("evaluation/evaluation.jl")

# Optimisation pipeline
include("optimisation/abc.jl")

# Integrations
include("integrations/gwas.jl")

# Main program and wrappers
include("run_program.jl")
include("run_geno.jl")
include("run_pheno.jl")
include("fetch.jl")

export run_geno, run_pheno, fetch, run_program

end
