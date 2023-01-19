module Seq
export fibseq, safefibseq

using ..Fib: first_fib_pair, next_fib_pair
using OffsetArrays: Origin

function _fib_seq(n::Integer)
    if n < 0
        return Origin(0)(BigInt[])
    end
    result = Origin(0)(zeros(BigInt, n + 1))
    f0, f1 = first_fib_pair
    for i = 1:n
        result[i] = f1
        f0, f1 = next_fib_pair(f0, f1)
    end
    result 
end

function fibseq(n::Unsigned)
    _fib_seq(n)
end

function fibseq(n::Signed)
    if n < 0
        throw(DomainError(n))
    else
        _fib_seq(n)
    end
end

function fibseq(r::UnitRange{T} where T <: Unsigned)
    Origin(r.start)(_fib_seq(r.stop)[r.start:r.stop])
end

function fibseq(r::UnitRange{T} where T <: Signed)
    if r.start ≥ 0 && r.stop ≥ r.start
        Origin(r.start)(_fib_seq(r.stop)[r.start:r.stop])
    else
        throw(DomainError(r))
    end
end

function safefibseq(r::UnitRange{T} where T <: Integer)
    if r.start ≥ 0 && r.stop ≥ r.start
        Origin(r.start)(_fib_seq(r.stop)[r.start:r.stop])
    else
        nothing
    end
end

end