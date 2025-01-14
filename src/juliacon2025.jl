module JuliaCon2025
using ..TheDerivativeGraph

function function_to_derivative()
    n3 = Node("g")
    n2 = Node("y")
    n1 = Node("x")

    e1 = Edge("∂g/∂x", n3, n1)
    e2 = Edge("∂g/∂y", n3, n2)

    return (e1, e2)
end
export function_to_derivative

function example1()
    n5 = Node("g")
    n4 = Node("h")
    n3 = Node("a")
    n2 = Node("b")
    n1 = Node("x")

    e5 = Edge("∂g/∂h", n5, n4)
    e4 = Edge("∂h/∂a", n4, n3)
    e3 = Edge("∂h/∂b", n4, n2)
    e2 = Edge("∂a/∂x", n3, n1)
    e1 = Edge("∂b/∂x", n2, n1)
    return (e1, e2, e3, e4, e5)
end
export example1

function example1_sequence()
    e1, e2, e3, e4, e5 = example1()
    n5 = top(e5)
    n4 = bott(e5)
    n3 = bott(e4)
    n2 = top(e1)
    n1 = bott(e1)

    n5.function_label = ""
    for node in (n4, n3, n2, n1)
        node.derivative_label = node.function_label
    end

    for edge in (e1, e2, e3, e4)
        edge.label = ""
    end

    e5.color = (255, 0, 0)
    return (e1, e2, e3, e4, e5)
end


function color_path!(edges, path_edges, color)
    for edge in edges
        if edge in path_edges
            edge.color = color
        end
    end
end

function example1_path1()
    edges = example1()
    _, e2, _, e4, e5 = edges
    color_path!(edges, (e5, e4, e2), (255, 0, 0))
    return edges
end
export example1

function example1_path2()
    edges = example1()
    e1, _, e3, _, e5 = edges
    color_path!(edges, (e5, e3, e1), (0, 255, 0))
    return edges
end
export example1

function exponential_paths()
    n1 = Node("f1")
    n2 = Node("f2")
    n3 = Node("f3")

    e1 = Edge("D1", n3, n2)
    e2 = Edge("D2", n3, n2)
    e3 = Edge("D3", n2, n1)
    e4 = Edge("D4", n2, n1)

    return (e1, e2, e3, e4)
end

function exponential_paths1()
    edges = exponential_paths()
    e1, _, e3, _ = edges
    color_path!(edges, (e1, e3), (255, 0, 0))
    return edges
end

function exponential_paths2()
    edges = exponential_paths()
    e1, _, _, e4 = edges
    color_path!(edges, (e1, e4), (255, 0, 0))
    return edges
end
function exponential_paths3()
    edges = exponential_paths()
    _, e2, _, e4 = edges
    color_path!(edges, (e2, e4), (255, 0, 0))
    return edges
end
function exponential_paths4()
    edges = exponential_paths()
    _, e2, e3, _ = edges
    color_path!(edges, (e2, e3), (255, 0, 0))
    return edges
end

end #module