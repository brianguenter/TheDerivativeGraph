module Forward
using ..TheDerivativeGraph



function binary_tree()
    n8 = Node("cos", "f₃")
    n7 = Node("cos", "f₂")
    n6 = Node("cos", "f₁")
    n5 = Node("cos", "f₀")
    n4 = Node("cos")
    n3 = Node("ln")
    n2 = Node("sin")
    n1 = Node("x₀")

    e1 = Edge("D₁", n2, n1)
    e2 = Edge("D₂", n3, n2)
    e3 = Edge("D₃", n4, n2)
    e4 = Edge("D₄", n5, n3)
    e5 = Edge("D₅", n6, n3)
    e6 = Edge("D₆", n7, n4)
    e7 = Edge("D₇", n8, n4)
    return (e1, e2, e3, e4, e5, e6, e7)
end
export binary_tree

const graphs = [binary_tree]

export graphs
end #module
export Forward