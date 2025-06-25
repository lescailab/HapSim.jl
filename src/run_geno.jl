using YAML

"""Run genotype simulation using the provided configuration file.
The number of Julia threads can be specified via `threads`.
"""
function run_geno(threads::Integer, config_file::String)
    ENV["JULIA_NUM_THREADS"] = string(threads)
    options = YAML.load_file(config_file)
    pipelines = Dict(
        "preprocessing" => false,
        "genotype" => true,
        "phenotype" => false,
        "evaluation" => false,
        "optimisation" => false,
    )
    run_program(pipelines, options)
end

end # file

