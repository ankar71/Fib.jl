module Num
export fib, safefib

using .. Fib: first_fib_pair, next_fib_pair

function _fib(n::Integer) #return 0 for negatives
    f0, f1 = first_fib_pair
    if n ≤ 0
        return f0
    elseif n == 1
        return f1
    else
        while n ≥ 2
            f0, f1 = next_fib_pair(f0, f1)
            n -= 1
        end
    end
    f1
end

function fib(n::Unsigned)
    return _fib(n)
end

function fib(n::Signed)
    if n < 0
        throw(DomainError(n))
    else
        _fib(n)
    end
end

function safefib(n::Signed)::Union{BigInt, Nothing}
    if n < 0
        return nothing
    else
        return _fib(n)
    end
end

end