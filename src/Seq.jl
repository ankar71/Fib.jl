module Seq
export fibseq, safefibseq

using OffsetArrays: Origin
using ..Num: fibpair

function safefibseq(n::Integer)
    safefibseq(1:n)
end

function fibseq(n::Integer)
    result = safefibseq(1:n)
    if result === nothing
        throw(DomainError(n))
    end
    result
end


function safefibseq(r::UnitRange{<:Integer})
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

function fibseq(r::UnitRange{<:Integer})
    result = safefibseq(r)
    if result === nothing
        throw(DomainError(r))
    end
    result
end

end