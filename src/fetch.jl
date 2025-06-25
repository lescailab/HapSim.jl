function fetch(data_dir::String)
    script_path = joinpath(dirname(@__FILE__), "scripts", "fetch.sh")
    run(`bash $script_path $data_dir`)
end

