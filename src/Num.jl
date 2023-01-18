module Num
export fib

using .. Fib: first_fib_pair, next_fib_pair

function fib(n::Unsigned)
    f0, f1 = first_fib_pair
    if n == 0
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

end