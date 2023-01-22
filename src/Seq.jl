module Seq
export fibseq, safefibseq

using OffsetArrays: Origin, OffsetVector
using ..Num: fibpair


"""
    safefibseq(r::UnitRange{<:Integer})

Compute the fibonacci sequence for the positions given in the range `r`.
The sequence is returned as an [`OffsetArrays.OffsetVector`](@ref) with the same indices as the given range.

Requirement: `0 < r.start ≤ r.stop`.

Return `nothing` for invalid ranges.

# Example
```julia-repl
julia> safefibseq(2:5)
4-element OffsetArray(::Vector{BigInt}, 2:5) with eltype BigInt with indices 2:5:
 1
 2
 3
 5
```
"""
function safefibseq(r::UnitRange{<:Integer})::Union{OffsetVector{BigInt, Vector{BigInt}}, Nothing}
    if 0 < r.start <= r.stop
        n = r.stop - r.start + 1
        f_n, f_n1 = fibpair(r.start)
        v = sizehint!(Vector{BigInt}(), n)
        if n == 1
            push!(v, f_n)
        else
            push!(v, f_n, f_n1)
            for i = 3:n
                push!(v, v[i-2] + v[i-1])
            end
        end
        Origin(r.start)(v)
    else
        nothing
    end
end


"""
    safefibseq(n::Integer)

Same as `safefibseq(1:n)`
"""
function safefibseq(n::Integer)
    safefibseq(1:n)
end


"""
    fibseq(r::UnitRange{<:Integer})

Compute the fibonacci sequence for the positions given in the range `r`.
The sequence is returned as an [`OffsetVector`](@ref) with the same indices as the given range.

Requirement: `0 < r.start ≤ r.stop`.

Throw a `DomainError` for invalid ranges.

# Example
```julia-repl
julia> fibseq(2:5)
4-element OffsetArray(::Vector{BigInt}, 2:5) with eltype BigInt with indices 2:5:
 1
 2
 3
 5
```
"""
function fibseq(r::UnitRange{<:Integer})::OffsetVector{BigInt, Vector{BigInt}}
    result = safefibseq(r)
    if result === nothing
        throw(DomainError(r))
    end
    result
end


"""
    fibseq(n::Integer)

Same as fibseq(1:n)
"""
function fibseq(n::Integer)
    result = safefibseq(1:n)
    if result === nothing
        throw(DomainError(n))
    end
    result
end

end