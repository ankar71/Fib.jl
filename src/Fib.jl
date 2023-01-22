"Collection of functions for the calculation of numbers in the fibonacci sequence."
module Fib
export fib, fib0, safefib, fibseq, safefibseq, main

include("Num.jl")
using .Num

include("Seq.jl")
using .Seq

include("Cmd.jl")
using  .Cmd: main

end
