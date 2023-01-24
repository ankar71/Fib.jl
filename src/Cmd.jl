module Cmd
using ArgParse
import ..Fib

function get_args(args)
    arg_settings = ArgParseSettings(description="Print a sequence of fibonacci numbers")
    @add_arg_table arg_settings begin
        "--index", "-i"
            help = "Start at index INDEX. Indices less than one are treated as 1."
            arg_type = Int
            default = 1
        "length"
            help = """The number of the fibonacci numbers to be printed.
                   Use negative length to display a sequence in reverse.
                   """
            arg_type = Int
            default = 1
    end
    parse_args(args, arg_settings)
end

function main(args=ARGS)
    parsed_args = get_args(args)
    # for (arg, val) in parsed_args
    #     println("$arg: $val ($(typeof(val)))")
    # end
    index = parsed_args["index"]
    if index < 1
        println("Negative index ignored. Starting at 1.")
        index = 1
    end
    n = parsed_args["length"]
    n == 0 && return # Do nothing for zero length
    is_reversed = false
    if n < 0
        n = -n
        is_reversed = true
    end

    range = index:(index+n-1)
    seq = Fib.fibseq(range)
    if is_reversed
        range=reverse(range)
    end

    for i=range
        println("$i: $(seq[i])")
    end

end

end