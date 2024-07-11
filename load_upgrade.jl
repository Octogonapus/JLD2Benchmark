using JLD2, IntelITT

@kwdef struct Foo
    a::Int
    newfield::Int = 2
end

function main()
    @time Threads.@threads for i in 1:Threads.nthreads()
        @show JLD2.load("$i.jld2"; typemap=Dict("Main.Foo" => JLD2.Upgrade(Foo)))
    end
end

JLD2.rconvert(::Type{Main.Foo}, nt::NamedTuple) = Foo(; nt...)

@info "Warmup:"
main()

@info "Running:"
# IntelITT.resume()
main()
