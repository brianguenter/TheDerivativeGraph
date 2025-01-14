module SymbolicForward
using ForwardDiff

abstract type AbstractNode end

struct Leaf <: AbstractNode
    name::Symbol
end
export Leaf

struct Constant <: AbstractNode
    value::Float64
end

Base.one(::Type{T}) where {T<:AbstractNode} = Constant(1.0)
Base.zero(::Type{T}) where {T<:AbstractNode} = Constant(0.0)
Base.show(io::IO, a::Constant) = print(io, a.value)
export one

Base.show(io::IO, a::Leaf) = print(io, a.name)

struct Times <: AbstractNode
    left::AbstractNode
    right::AbstractNode
end

Base.:*(a::AbstractNode, b::AbstractNode) = Times(a, b)

struct Plus <: AbstractNode
    left::AbstractNode
    right::AbstractNode
end
Base.:+(a::AbstractNode, b::AbstractNode) = Plus(a, b)



function Base.show(io::IO, a::AbstractNode)
    if isa(a, Plus) || isa(a, Times)
        print(io, "(")
        show(io, a.left)
        print(io, " * ")
        show(io, a.right)
        print(io, ")")
    else
        print(io, a.name)
    end
end

end #module