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

"""
    safefib(n)

Compute the fibonacci number ar position `n`.
If n < 1, return `nothing`.

"""
function safefib(n::Integer)::Union{BigInt,Nothing}
    n == 1 && return BigInt(1)
    p = fibpair(n - 1)
    p === nothing && return nothing
    p[2]
end

"""
    fib(n)

Compute the fibonacci number at position `n`.
Throw a `DomainError` when `n < 1`.
"""
function fib(n::Integer)::BigInt
    result = safefib(n)
    result === nothing && throw(DomainError(n))
    result
end


"""
    fib0(n)

Same as [`fib`](@ref) but treat zero as a valid input returning `BigInt(0)`.
"""
function fib0(n::Integer)::BigInt
    n == 0 && return BigInt(0)
    fib(n)
end

end