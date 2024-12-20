function exp_x_squared()
n3 = Node("x", "")
n2 = Node("*", "")
n1 = Node("exp", "f′(x)")

e1 = Edge("x", n3, n2)
e2 = Edge("x", n3,n2)
e3 = Edge("exp(x*x)", n1, n2)

return (e1, e2, e3)
end