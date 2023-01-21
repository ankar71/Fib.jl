module Seq
export fibseq, safefibseq

using ..Fib: next_fib_pair
using OffsetArrays: Origin

function safefibseq(n::Integer)
    n < 1 && return nothing
    result = Vector{BigInt}(undef, n)
    f_n1 = f_n =  BigInt(1)
    result[1] = f_n1
    n == 1 && return result
    result[2] = f_n
    for i = 3:n
        f_n1, f_n = next_fib_pair(f_n1, f_n)
        result[i] = f_n
    end
    result 
end

function fibseq(n::Integer)
    result = safefibseq(n)
    if result === nothing
        throw(DomainError(n))
    end
    result
end


function safefibseq(r::UnitRange{<:Integer})
    if 0 < r.start <= r.stop
        Origin(r.start)(safefibseq(r.stop)[r.start:r.stop])
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