module Fib

function fib(n::Unsigned)
    if n ≤ 1
        return BigInt(n)
    end
    f0 = BigInt(0)
    f1 = BigInt(1)
    for i = 2:n
        f0, f1 = f1, f0 + f1
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

export fib

end
