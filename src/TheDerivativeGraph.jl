module TheDerivativeGraph
using FastDifferentiation
import FastDifferentiation as FD

include("draw.jl")
include("function_illustrations.jl")
include("shared.jl")
include("reverse_illustrations.jl")
include("forward_illustrations.jl")
include("BAx.jl")
include("Ab.jl")

function write_illustrations()
    dir = "src/illustrations/"
    for mod in Shared.modifiers
        for package in (Forward, Reverse)
            full_name = "$(package)_$(package.binary_tree)_$mod"
            no_project = split(full_name, ".")[2]

            path = dir * no_project
            write_dot(path * ".svg", make_dot_graph(mod(package.binary_tree())))
            write_dot(path * "D.svg", make_dot_graph(mod(package.binary_tree()), false))
            rm(path * ".dot")
        end
    end

    for Ab_example in Ab_all()
        path = dir * "Ab/"
        if Ab_example === Ab_illustration
            graph = make_dot_graph(Ab_example())
            write_dot(path * "$(Ab_example)" * ".svg", graph)
            graph = make_dot_graph(Ab_example(), false)
            write_dot(path * "$(Ab_example)" * "D.svg", graph)
        else
            graph = make_dot_graph(Ab_example(), false)
            write_dot(path * "$(Ab_example)" * "D.svg", graph)
        end
    end

    for BAx_example in BAx_all()
        full_name = "$BAx_example"

        path = dir * "BAx/" * full_name

        if BAx_example === BAx_illustration
            graph = make_dot_graph(BAx_example())
            write_dot(path * ".svg", graph)
        else
            graph = make_dot_graph(BAx_example(), false)
            write_dot(path * "D.svg", graph)
        end
    end

end
export write_illustrations

# function sum_of_squares()
#     A = make_variables(:A,3,3)
#     b = make_variables(:b,3)

#     tmp = Node.(A*b)



end #module