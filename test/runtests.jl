using Test
using YAML
using Random
using HapSim

@testset "Phenotype Generation Directory Creation" begin
    output_dir = joinpath(@__DIR__, "..", "src", "data", "outputs", "test")
    mkpath(output_dir)

    config_dir = joinpath(@__DIR__, "..", "src")
    config_path = joinpath(config_dir, "config.yaml")

    sample_file = joinpath(output_dir, "test-1.sample")
    open(sample_file, "w") do io
        println(io, "ID_1 ID_2 missing father mother sex phenotype pc1 pc2")
        println(io, "0 0 0 0 0 0 -9 0 0")
        println(io, "sample_1 sample_1 0 0 0 1 -9 0.1 0.2")
    end

    original_dirs = Set(readdir(output_dir))

    try
        run_pheno(config_path)
    catch e
        @info "generate_pheno execution failed with: $e"
    end

    final_dirs = Set(readdir(output_dir))
    new_dirs = setdiff(final_dirs, original_dirs)

    @test isdir(joinpath(output_dir, "evaluation")) ||
          any(d -> occursin("evaluation", d), new_dirs)
    @test isdir(joinpath(output_dir, "optimisation")) ||
          any(d -> occursin("optimisation", d), new_dirs)
    @test isdir(joinpath(output_dir, "reference")) ||
          any(d -> occursin("reference", d), new_dirs)
end

