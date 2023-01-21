module Num
export fib, fib0, safefib

function fibpair(n::Integer)
    n < 1 && return nothing
    f_n = f_n1 = BigInt(1)
    while n > 1
        f_n, f_n1 = f_n1, f_n + f_n1
        n -= 1
    end
    (f_n, f_n1)
end

function safefib(n::Integer)::Union{BigInt,Nothing}
    n == 1 && return BigInt(1)
    p = fibpair(n - 1)
    p === nothing && return nothing
    p[2]
end

function fib(n::Integer)
    result = safefib(n)
    result === nothing && throw(DomainError(n))
    result
end

function fib0(n::Integer)
    n == 0 && return BigInt(0)
    fib(n)
end

end