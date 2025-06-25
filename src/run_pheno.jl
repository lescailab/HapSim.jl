using YAML

"""Run phenotype simulation using the provided configuration file."""
function run_pheno(config_file::String)
    options = YAML.load_file(config_file)
    pipelines = Dict(
        "preprocessing" => false,
        "genotype" => false,
        "phenotype" => true,
        "evaluation" => false,
        "optimisation" => false,
    )
    run_program(pipelines, options)
end

end # file

