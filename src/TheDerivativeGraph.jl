module TheDerivativeGraph
using FastDifferentiation
import FastDifferentiation as FD
import ForwardDiff

include("draw.jl")
include("exp_x_squared.jl")
include("function_illustrations.jl")
include("shared.jl")
include("reverse_illustrations.jl")
include("forward_illustrations.jl")
include("BAx.jl")
include("Ab.jl")
include("convolution.jl")
include("juliacon2025.jl")
include("SymbolicForward.jl")

function do_convolution(dir)
    for conv_example in convolution_all()
        full_name = "$conv_example"

        path = dir * "convolution/" * full_name

        if conv_example === convolution_illustration
            graph = make_dot_graph(conv_example())
            write_dot(path * ".svg", graph)
        else
            graph = make_dot_graph(conv_example(), false)
            write_dot(path * "D.svg", graph)
        end
    end
end
export do_convolution

function write_illustrations(dir="docs/src/illustrations/")
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

    graph = make_dot_graph(Forward.basic_forward_example())
    write_dot(dir * "$(Forward.basic_forward_example).svg", graph)

    graph = make_dot_graph(exp_x_squared())
    write_dot(dir * "$exp_x_squared.svg", graph)
    graph = make_dot_graph(exp_x_squared(), false)
    write_dot(dir * "$exp_x_squared" * "D.svg", graph)

    do_convolution(dir)

end
export write_illustrations

function function_svg(dir, graph_func)
    graph = make_dot_graph(graph_func())
    name = "$(graph_func)"
    write_dot(dir * "$name.svg", graph)
end

function derivative_svg(dir, graph_func)
    graph = make_dot_graph(graph_func(), false)
    name = "$(graph_func)"
    write_dot(dir * "$name" * "D.svg", graph)
end

function write_JuliaCon(dir="JuliaCon2025/images/")
    function_svg(dir, JuliaCon2025.example1)
    derivative_svg(dir, JuliaCon2025.example1)

    derivative_svg(dir, JuliaCon2025.example1_path1)
    derivative_svg(dir, JuliaCon2025.example1_path2)
    for func in (JuliaCon2025.exponential_paths,
        JuliaCon2025.exponential_paths1,
        JuliaCon2025.exponential_paths2,
        JuliaCon2025.exponential_paths3,
        JuliaCon2025.exponential_paths4)

        derivative_svg(dir, func)
    end

    derivative_svg(dir, JuliaCon2025.example1_sequence)
    function_svg(dir, JuliaCon2025.function_to_derivative)
    derivative_svg(dir, JuliaCon2025.function_to_derivative)
end
export write_JuliaCon


end #module