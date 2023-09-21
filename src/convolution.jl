function sf()
    s = make_variables(:s, 10)
    f = make_variables(:f, 3)

    half = length(f) ÷ 2
    g(i) = FD.Node(sum((i - l < 1 || i - l > length(s) ? 0 : s[i-l] * f[l+half+1]) for l in -half:half))

    [g(i) for i in 1:lastindex(s)], s, f
end
export sf

function Dsf()
    g, s, f = sf()
    return jacobian(g, s), jacobian(g, f)
end
export Dsf

function index_solution_s()
    s = make_variables(:s, 10)
    f = make_variables(:f, 3)
    half = length(f) ÷ 2

    Dg(i, u) = 1 ≤ i - u + half + 1 ≤ length(f) ? f[i-u+half+1] : 0

    [Dg(i, u) for i in 1:lastindex(s), u in 1:lastindex(s)]
end
export index_solution

function convolution_illustration()

    n4 = Node("gᵢ = ∑ₖ", "Dgᵢᵤ")
    n3 = Node("*", "")
    n1 = Node("s[i-k]", "s[i-k]")
    n2 = Node("f[k+half+1]", "f[k+half+1]")

    e1 = Edge("f[k+half+1]", n3, n1)
    e2 = Edge("s[i-k]", n3, n2)
    e3 = Edge("1", n4, n3)
    return (e1, e2, e3)
end
export convolution_illustration

function convolution_partial_s_step0()
    e1, e2, e3 = convolution_illustration()

    n4 = top(e3)
    n4.derivative_label = "Dgᵢᵤ = ∑ₖ"
    n2 = bott(e2)
    n2.label_color = de_emph
    e2.label_color = de_emph
    e2.color = de_emph
    e3.label = "1"
    return e1, e2, e3
end
export convolution_partial_s_step0

function convolution_partial_s_step1()
    e1, e2, e3 = convolution_partial_s_step0()

    n1 = bott(e1)
    n1.derivative_label = "sub(u=i-k,s[i-k])"
    n2 = bott(e2)

    return e1, e2, e3
end
export convolution_partial_s_step

function convolution_partial_s_step2()
    e1, e2, e3 = convolution_partial_s_step1()

    n1 = bott(e1)
    n1.derivative_label = "s[u]"
    e1.label = "sub(u=i-k,f[k+half+1])"
    return e1, e2, e3
end
export convolution_partial_s_step2


function convolution_partial_s_step3()
    e1, e2, e3 = convolution_partial_s_step2()

    n4 = top(e3)
    e1.label = "f[i-u+half+1])"
    n4.derivative_label = "Dgᵢᵤ = sub(u=i-k,∑ₖ)"
    return e1, e2, e3
end
export convolution_partial_s_step3

function convolution_partial_s_step4()
    e1, e2, e3 = convolution_partial_s_step3()

    n4 = top(e3)
    n4.derivative_label = "Dgᵢᵤ)"
    return e1, e2, e3
end
export convolution_partial_s_step3

convolution_all() = (convolution_illustration, convolution_partial_s_step0, convolution_partial_s_step1, convolution_partial_s_step2, convolution_partial_s_step3, convolution_partial_s_step4)
export convolution_all



