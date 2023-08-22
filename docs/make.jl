using Documenter
using TheDerivativeGraph

makedocs(
    sitename="TheDerivativeGraph",
    format=Documenter.HTML(),
    modules=[TheDerivativeGraph],
    pages=[
        "index.md",
        "The Derivative Graph" => "thederivativegraph.md",
        "Future work" => "futurework.md"
    ]
)

deploydocs(
    repo="github.com/brianguenter/TheDerivativeGraph.jl.git",
    devbranch="main"
)
