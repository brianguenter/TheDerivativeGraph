module Shared
using TheDerivativeGraph

function bin_path1(e)
    e[1].color = red
    e[2].color = red
    e[4].color = red
    return e
end
export bin_path1

function bin_path2(e)
    e[1].color = red
    e[2].color = red
    e[5].color = red
    return e
end
export bin_path2

function times_used(e)
    e[1].label = "2"
    e[2].label = "2"
    e[3].label = "1"
    e[4].label = "1"
    e[5].label = "1"
    e[6].label = "1"
    return e
end
export times_used

function roots_leaves_used(e)
    e[1].label = "roots=1\nleaves=2"
    e[2].label = "roots=1\nleaves=2"
    e[3].label = "roots=1\nleaves=1"
    e[4].label = "roots=1\nleaves=1"
    e[5].label = "roots=1\nleaves=1"
    e[6].label = "roots=1\nleaves=1"
    return e
end
export roots_leaves_used

function Dterm_weights(e)
    e[1].label = "D₁:4"
    e[2].label = "D₂:2"
    e[3].label = "D₃:2"
    e[4].label = "D₄:1"
    e[5].label = "D₅:1"
    e[6].label = "D₆:1"
    e[7].label = "D₇:1"
    return e
end
export Dterm_weights

const modifiers = [bin_path1, bin_path2, times_used, roots_leaves_used, Dterm_weights]
export modifiers

end #module
export Shared
