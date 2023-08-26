function DAb()
    A = make_variables(:A, 2, 2)
    b = make_variables(:b, 2)

    jac = jacobian(FD.Node.(A * b), vec(A))

    # reshape(jac, 2, 2, 2)
end
export DAb

function DAbx()
    x = make_variables(:x, 2, 2)

    jac = DAb()
    res = zeros(FD.Node, 2)

    for index in CartesianIndices(x)
        res[index[2]] += x[index[1], index[2]] * jac[index[1], index[1], index[2]]
    end
    return res
end
export DAbx

function Ab_illustration()
    n5 = Node("fᵢ", "Dfᵢₘₙ")
    n4 = Node("∑ⱼ", "∑ⱼ")
    n3 = Node("*")
    n2 = Node("bⱼ", "bⱼ")
    n1 = Node("Aᵢⱼ", "Aᵢⱼ")

    e1 = Edge("bⱼ", n3, n1)
    e2 = Edge("Aᵢⱼ", n3, n2)
    e3 = Edge("1", n4, n3)
    e4 = Edge("1", n5, n4)
    return (e1, e2, e3, e4)
end
export Ab_illustration

function Ab_partial_path()
    e1, e2, e3, e4 = Ab_illustration()

    n2 = bott(e2)
    n2.color = de_emph
    n2.label_color = de_emph
    e2.color = de_emph
    e2.label_color = de_emph
    n1 = bott(e1)
    return e1, e2, e3, e4
end

function Ab_partial_Aij_step1()
    e1, e2, e3, e4 = Ab_partial_path()

    n1 = bott(e1)
    n1.derivative_label = "sub((i=>m,j=>n)),Aᵢⱼ"
    return e1, e2, e3, e4
end

function Ab_partial_Aij_step2()
    e1, e2, e3, e4 = Ab_partial_Aij_step1()

    n1 = bott(e1)
    n1.derivative_label = "Aₘₙ"
    e1.label = "sub((i=>m,j=>n)),bⱼ"
    return e1, e2, e3, e4
end

function Ab_partial_Aij_step3()
    e1, e2, e3, e4 = Ab_partial_Aij_step2()

    e1.label = "bₙ"
    n4 = top(e3)
    n4.derivative_label = "sub((i=>m,j=>n), ∑ⱼ)"
    return e1, e2, e3, e4
end

function Ab_partial_Aij_step4()
    e1, e2, e3, e4 = Ab_partial_Aij_step3()

    n4 = top(e3)
    n4.derivative_label = ""
    n5 = top(e4)
    n5.derivative_label = "sub((i=>m,j=>n), Dfᵢₘₙ"
    return e1, e2, e3, e4
end

function Ab_partial_Aij_step5()
    e1, e2, e3, e4 = Ab_partial_Aij_step3()

    n4 = top(e3)
    n4.derivative_label = ""
    n5 = top(e4)
    n5.derivative_label = "Dfᵢ₌ₘ,ₘₙ = ∂fᵢ/∂Aₘₙ (= 0 when i≠m)"
    return e1, e2, e3, e4
end


Ab_all() = (Ab_illustration, Ab_partial_path, Ab_partial_Aij_step1, Ab_partial_Aij_step2, Ab_partial_Aij_step3, Ab_partial_Aij_step4, Ab_partial_Aij_step5)