module Fib
using OffsetArrays: Origin

const first_fib_pair = BigInt(0), BigInt(1)
@inline next_fib_pair(f0, f1) = f1, f0 + f1

function fib(n::Unsigned)
    f0, f1 = first_fib_pair
    if n == 0
        return f0
    elseif n == 1
        return f1
    else
        for _ = 2:n
            f0, f1 = next_fib_pair(f0, f1)
        end
    end
    f1
end

function fib(n::Signed)
    try
        fib(convert(Unsigned, n))
    catch e
        if isa(e, InexactError)
            throw(DomainError(n))
        else
            rethrow(e)
        end
    end
end

function fib_seq(n::Unsigned)
    result = Origin(0)(zeros(BigInt, n + 1))
    f0, f1 = first_fib_pair
    for i = 1:n
        result[i] = f1
        f0, f1 = next_fib_pair(f0, f1)
    end
    result 
end


function fib_seq(n::Signed)
    try
        fib_seq(convert(Unsigned, n))
    catch e
        if isa(e, InexactError)
            throw(DomainError(n))
        else
            rethrow(e)
        end
    end
end

function fib_seq(r::UnitRange{T} where T <: Unsigned)
    fib_seq(r.stop)[r.start:r.stop]
end

function fib_seq(r::UnitRange{T} where T <: Signed)
    try
        ur = convert(UnitRange{Unsigned}, r)
        fib_seq(ur)
    catch e
        if isa(e, InexactError)
            throw(DomainError(r))
        else
            rethrow(e)
        end
    end
end

export fib, fib_seq


end
