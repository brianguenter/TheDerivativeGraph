
module Reverse
using ..TheDerivativeGraph

function binary_tree()
    n1 = Node("cos", "f0")
    n2 = Node("*")
    n3 = Node("*")
    n4 = Node("*")
    n5 = Node("x₀", "x₀")
    n6 = Node("x₁", "x₁")
    n7 = Node("x₂", "x₂")
    n8 = Node("x₃", "x₃")
    e1 = Edge("D₁", n1, n2)
    e2 = Edge("D₂", n2, n3)
    e3 = Edge("D₃", n2, n4)
    e4 = Edge("D₄", n3, n5)
    e5 = Edge("D₅", n3, n6)
    e6 = Edge("D₆", n4, n7)
    e7 = Edge("D₇", n4, n8)
    return (e1, e2, e3, e4, e5, e6, e7)
end
export binary_tree


end #module

export Reverse

