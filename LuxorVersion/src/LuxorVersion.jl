module LuxorVersion
using Luxor
using MathTeXEngine

function draw_latex()
    @draw begin

        path_svg = "latexexample.svg"
        for dist in -100:100
            Drawing(600, 400, path_svg)
            origin()
            background("grey6")
            fontsize(26)
            sethue("white")
            t₁ = L"e^{i\pi} + 1 = 0"
            t₂ = L"e^x = \sum^\infty_{n=0} \frac{x^n}{n!} = \lim_{n\to\infty}(1+\frac{x}{n})^n"
            t₃ = L"\cos(\theta)"

            text(t₁, Point(0, dist), halign=:center, valign=:baseline, angle=0)
            text(t₂, Point(0, -20), halign=:center, valign=:top, angle=0)

            line(Point(0, 132), Point(50, 132), action=:stroke)
            line(Point(0, 132), Point(50cos(π / 4), 132 - 50sin(π / 4)), action=:stroke)

            fontsize(18)
            text(t₃, Point(0, 120), halign=:left, valign=:baseline, angle=-π / 4, rotationfixed=false)
            finish()
        end
    end
end
export draw_latex

include(dirname(pathof(Luxor)) * "/play.jl")

function realtime()
    let dist = -200
        @play 400 400 begin
            #
            # background("black")
            # sethue("white")
            # rotate(θ)
            # hypotrochoid(200, 110, 37, :stroke)
            # θ += π / 120
            # sleep(0.01)
            #

            origin()
            background("grey6")
            fontsize(26)
            sethue("white")
            t₁ = L"e^{i\pi} + 1 = 0"
            t₂ = L"e^x = \sum^\infty_{n=0} \frac{x^n}{n!} = \lim_{n\to\infty}(1+\frac{x}{n})^n"
            t₃ = L"\cos(\theta)"

            text(t₁, Point(0, dist), halign=:center, valign=:baseline, angle=0)
            text(t₂, Point(0, -20), halign=:center, valign=:top, angle=0)

            line(Point(0, 132), Point(50, 132), action=:stroke)
            line(Point(0, 132), Point(50cos(π / 4), 132 - 50sin(π / 4)), action=:stroke)

            fontsize(18)
            text(t₃, Point(0, 120), halign=:left, valign=:baseline, angle=-π / 4, rotationfixed=false)
            dist += 1
            (0.01)
        end
    end
end
export realtime
end # module LuxorVersion
