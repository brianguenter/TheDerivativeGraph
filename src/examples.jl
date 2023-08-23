function BAx()
    B = make_variables(:B, 2, 2)
    A = make_variables(:A, 2, 2)
    x = make_variables(:x, 2)

    f = FD.Node.(B * (A * x))

    jac = jacobian(f, x)
    display(jac)
end
export BAx

function BAx_illustration()
    n7 = Node("∑ᵢ", "fₖ=∑ᵢ")
    n6 = Node("*")
    n5 = Node("∑ⱼ", "∑ⱼ")
    n4 = Node("*")
    n3 = Node("xj", "xj")
    n2 = Node("Aᵢⱼ", "Aᵢⱼ")
    n1 = Node("Bₖᵢ", "Bₖᵢ")

    e1 = Edge("xj", n4, n2)
    e2 = Edge("Aᵢⱼ", n4, n3)
    e3 = Edge("1", n5, n4)
    e4 = Edge("∑ⱼAᵢⱼ*xj", n6, n1)
    e5 = Edge("Bₖᵢ", n6, n5)
    e6 = Edge("1", n7, n6)
    return (e1, e2, e3, e4, e5, e6)
end
export BAx_illustration

function BAx_partial_xj()
    e1, e2, e3, e4, e5, e6 = BAx_illustration()

    n2 = bott(e1)
    n2.color = white
    n2.label_color = white
    e1.color = white
    e1.label_color = white
    n5 = bott(e4)
    n5.label_color = white
    e4.label_color = white
    e4.color = white

    return (e1, e2, e3, e4, e5, e6)
end
export BAx_partial_xj

function BAx_partial_xj_step1()
    e1, e2, e3, e4, e5, e6 = BAx_partial_xj()

    n2 = bott(e2)
    n2.derivative_label = "sub((j=>n),xₙ)"
    return (e1, e2, e3, e4, e5, e6)
end
export BAx_partial_xj_step1


function BAx_partial_xj_step2()
    e1, e2, e3, e4, e5, e6 = BAx_partial_xj()

    n2 = bott(e2)
    n2.derivative_label = "xₙ"
    e2.label = "sub(j=>n,Aᵢⱼ )"
    return (e1, e2, e3, e4, e5, e6)
end
export BAx_partial_xj_step2

function BAx_partial_xj_step3()
    e1, e2, e3, e4, e5, e6 = BAx_partial_xj_step2()

    n5 = bott(e5)
    n5.derivative_label = "sub((j=>n), ∑ⱼ )"
    e2.label = "Aᵢₙ"
    return (e1, e2, e3, e4, e5, e6)
end
export BAx_partial_xj_step3

function BAx_partial_xj_step4()
    e1, e2, e3, e4, e5, e6 = BAx_partial_xj_step3()

    n5 = bott(e5)
    n5.label_color = white
    return (e1, e2, e3, e4, e5, e6)
end
export BAx_partial_xj_step4

BAx_all() = (BAx_illustration, BAx_partial_xj, BAx_partial_xj_step1, BAx_partial_xj_step2, BAx_partial_xj_step3, BAx_partial_xj_step4)