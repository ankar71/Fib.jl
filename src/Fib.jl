module Fib
export fib, fib_seq, main

const first_fib_pair = BigInt(0), BigInt(1)
@inline next_fib_pair(f0::BigInt, f1::BigInt) = f1, f0 + f1

include("Num.jl")
using .Num

include("Seq.jl")
using .Seq

include("Cmd.jl")
using  .Cmd: main

end
