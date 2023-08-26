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
