# JLD2Benchmark

1. Run `create.jl`
2. Run `load.jl` with `-t 4` and observe that all runs of `JLD2.load` invoke the compiler during type reconstruction

```julia
$ julia -t 4 --project .\load.jl
[ Info: Warmup:
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
  0.104121 seconds (41.63 k allocations: 2.747 MiB, 374.56% compilation time)
[ Info: Running:
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
┌ Warning: saved type Foo is missing field newfield in workspace type; reconstructing
└ @ JLD2 C:\Users\salmon\.julia\packages\JLD2\MYcfT\src\data\reconstructing_datatypes.jl:207
  0.004638 seconds (2.44 k allocations: 218.422 KiB)


$ julia -t 4 --project .\load_upgrade.jl
[ Info: Warmup:
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
  0.879622 seconds (415.31 k allocations: 29.382 MiB, 397.27% compilation time)
[ Info: Running:
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
JLD2.load("$(i).jld2"; typemap = Dict("Main.Foo" => JLD2.Upgrade(Foo))) = Dict{String, Any}("a" => Foo(1, 2))
  0.006499 seconds (1.26 k allocations: 169.875 KiB)
```
