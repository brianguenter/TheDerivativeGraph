function Ab_illustration()
    n4 = Node("∑ⱼ", "fᵢ=∑ⱼ")
    n3 = Node("*")
    n2 = Node("bⱼ", "bⱼ")
    n1 = Node("Aᵢⱼ", "Aᵢⱼ")

    e1 = Edge("bⱼ", n3, n1)
    e2 = Edge("Aᵢⱼ", n3, n2)
    e3 = Edge("1", n4, n3)
    return (e1, e2, e3)
end
export Ab_illustration

Ab_all() = (Ab_illustration,)