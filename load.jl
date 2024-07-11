using JLD2, IntelITT

struct Foo
    a::Int
    newfield::Int
end

function main()
    @time Threads.@threads for i in 1:Threads.nthreads()
        JLD2.load("$i.jld2")
    end
end

@info "Warmup:"
main()

@info "Running:"
# IntelITT.resume()
main()
