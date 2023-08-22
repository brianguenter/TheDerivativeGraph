module TheDerivativeGraph
using FastDifferentiation

include("draw.jl")
include("function_illustrations.jl")
include("shared.jl")
include("reverse_illustrations.jl")
include("forward_illustrations.jl")

function write_illustrations()
    for mod in Shared.modifiers
        for package in (Forward, Reverse)
            full_name = "$(package)_$(package.binary_tree)_$mod"
            no_project = split(full_name, ".")[2]

            path = "docs/src/illustrations/$(no_project)"
            write_dot(path * ".svg", make_dot_graph(mod(package.binary_tree())))
            write_dot(path * "D.svg", make_dot_graph(mod(package.binary_tree()), false))
            rm(path * ".dot")
        end
    end

end
export write_illustrations

# function sum_of_squares()
#     A = make_variables(:A,3,3)
#     b = make_variables(:b,3)

#     tmp = Node.(A*b)


end #module