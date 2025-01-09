module JuliaCon2025
using ..TheDerivativeGraph

function example1()
    n5 = Node("g")
    n4 = Node("h")
    n3 = Node("a")
    n2 = Node("b")
    n1 = Node("x")

    e5 = Edge("∂g/∂h)", n5, n4)
    e4 = Edge("∂h/∂a", n4, n3)
    e3 = Edge("∂h/∂b", n4, n2)
    e2 = Edge("∂a/∂x", n3, n1)
    e1 = Edge("∂b/∂x", n2, n1)
    return (e1, e2, e3, e4, e5)
end
export example1

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

end #module