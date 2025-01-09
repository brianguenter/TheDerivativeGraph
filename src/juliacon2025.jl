module JuliaCon2025
using ..TheDerivativeGraph

function example1()
    n5 = Node("exp")
    n4 = Node("*")
    n3 = Node("cos")
    n2 = Node("cos")
    n1 = Node("x")

    e5 = Edge("exp(cos(x)*(cos(x)))",n5,n4)
    e4 = Edge("cos(x)",n4,n3)
    e3 = Edge("cos(x)",n4,n2)
    e2 = Edge("-sin(x)",n3,n1)
    e1 = Edge("-sin(x)",n2,n1)
    return (e1,e2,e3,e4,e5)
end
export globby_tree
end #module