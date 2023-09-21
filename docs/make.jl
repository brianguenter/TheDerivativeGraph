using Documenter

makedocs(
    sitename="TheDerivativeGraph",
    # modules=[TheDerivativeGraph],
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
    ],
    # format=Documenter.LaTeX()
    # format=Documenter.HTML(
    #     mathengine=KaTeX(Dict(
    #         :delimiters => [
    #             Dict(:left => raw"$", :right => raw"$", display => false),
    #             Dict(:left => raw"$$", :right => raw"$$", display => true),
    #             Dict(:left => raw"\[", :right => raw"\]", display => true),
    #         ],
    #         :packages => ["cancel"]
    #     )
    #     ))

    # format=Documenter.HTML(
    #     mathengine=MathJax3(Dict(
    #         :tex => Dict(
    #             "inlineMath" => [["\$", "\$"], ["\\(", "\\)"]],
    #             "tags" => "ams",
    #             "packages" => ["base", "ams", "autoload", "cancel"],
    #         ),
    #     )))
)

deploydocs(
    repo="github.com/brianguenter/TheDerivativeGraph.jl.git",
    devbranch="main"
)
