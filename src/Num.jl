module Num
export fib, fib0, safefib

using ..Fib: next_fib_pair

function safefib(n::Integer)::Union{BigInt, Nothing}
    n < 1 && return nothing
    f_n1 = f_n = BigInt(1)
    while n > 2
        f_n1, f_n = next_fib_pair(f_n1, f_n)
        n -= 1
    end
    f_n
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