using Documenter
using TheDerivativeGraph

makedocs(
    sitename="TheDerivativeGraph",
    format=Documenter.HTML(),
    modules=[TheDerivativeGraph],
    pages=[
        "index.md",
        "The Derivative Graph" => "thederivativegraph.md",
        "Tensor Derivatives" => [
            "Introduction" => "tensorintro.md"
            "Examples" => [
                "Matrix vector multiplication" => "matvec.md"
                "Matrix matrix multiplication" => "matmat.md"
                "Convolution" => "convolution.md"
            ]
            "Theory" => "theory.md"
        ]
    ]
)

deploydocs(
    repo="github.com/brianguenter/TheDerivativeGraph.jl.git",
    devbranch="main"
)
