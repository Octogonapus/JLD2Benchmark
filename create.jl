using JLD2

struct Foo
    a::Int
end

for i in 1:4
    JLD2.save("$i.jld2", Dict("a" => Foo(1)))
end
