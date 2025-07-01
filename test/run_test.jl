using Test
using YAML
using Random
using HapSim

@testset "Phenotype Generation Directory Creation" begin
    # Define the output directory
    output_dir = joinpath(@__DIR__, "..", "src", "data", "outputs", "test")
    mkpath(output_dir)  # Ensure the directory exists before the test
    
    config_dir = joinpath(@__DIR__, "..", "src");
    options = joinpath(config_dir, "config.yaml")
    
    # Create mock input files that generate_pheno would expect
    sample_file = joinpath(output_dir, "test-1.sample")
    open(sample_file, "w") do io
        println(io, "ID_1 ID_2 missing father mother sex phenotype pc1 pc2")
        println(io, "0 0 0 0 0 0 -9 0 0")
        println(io, "sample_1 sample_1 0 0 0 1 -9 0.1 0.2")
    end
    
    # Capture the original output directory state
    original_dirs = Set(readdir(output_dir))
    
    # Run the generate_pheno function 
    
    try
    pipelines = Dict(
                 "preprocessing" => false,
                 "genotype" => true,
                 "phenotype" => false,
                 "evaluation" => false,
                 "optimisation" => false
             )   
run_program(pipelines, options)
    catch e
        # xx
       # @info "Note: generate_pheno execution failed with: $e"
    end
    
    # Check what directories were created
    final_dirs = Set(readdir(output_dir))
    new_dirs = setdiff(final_dirs, original_dirs)
    
    @info "Directories created by generate_pheno: $new_dirs"
    
    println("Output directory: ", output_dir)

    # Test that the expected directories were created
    @test isdir(joinpath(output_dir, "evaluation")) || 
          any(d -> occursin("evaluation", d), new_dirs)
    @test isdir(joinpath(output_dir, "optimisation")) ||
          any(d -> occursin("optimisation", d), new_dirs)
    @test isdir(joinpath(output_dir, "reference")) ||
          any(d -> occursin("reference", d), new_dirs)
    
    # Can also check for phenotype-specific output directories/files
    # @test isfile(joinpath(output_dir, "test-1.pheno1")) || 
    #       any(f -> occursin(".pheno1", f), readdir(output_dir, join=true))
end
