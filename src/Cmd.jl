module Cmd

import ..Fib

function main(args=ARGS)
    if length(args) != 1
        println("One positive number argument must be given")
    else
        arg = args[1]
        try
            n = parse(UInt, arg)
            println("$(Fib.fib(n))")
            return 0
        catch
            println("Invalid argument: $arg")
            return 1
        end
    end
end

end