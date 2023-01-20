module Fib
export fib, fib0, safefib, fibseq, safefibseq, main

@inline next_fib_pair(f1::BigInt, f2::BigInt) = f2, f1 + f2

include("Num.jl")
using .Num

include("Seq.jl")
using .Seq

include("Cmd.jl")
using  .Cmd: main

end
