#show link: set text(blue)

= The Derivative Graph and its Use in #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl")

#v(30pt)

The #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl") package is unlike other differentation systems:

- It does not use either forward or reverse AD.
- Unlike other AD algorithms #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl") computes a fully symbolic derivative.
- Unlike other symbolic algorithms #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl") can quickly compute efficient derivatives of large expressions.
- For $f:R^n -> R^m$ the  #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl") dense Jacobian generally scales more slowly than $text("min")(n,m)$.
- Efficent sparse Jacobians are problematic for conventional AD algorithms but require no special handling in #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl").

All of these beneficial characteristics, and more, are a simple consequence of the derivative representation used in #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl"): the _derivative graph_.

This talk will explain what the derivative graph is, how it is used in #link("https://github.com/brianguenter/FastDifferentiation.jl","FastDifferentiation.jl"), and how it might be used to create new hybrid AD algorithms for computing efficient derivatives across a broader class of functions than are currently handled by the Julia AD ecosystem.
