using Documenter
using TheDerivativeGraph

makedocs(
    sitename="TheDerivativeGraph",
    format=Documenter.HTML(),
    modules=[TheDerivativeGraph]
)

deploydocs(
    repo="github.com/brianguenter/TheDerivativeGraph.jl.git",
    devbranch="main"
)