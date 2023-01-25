# Fib

This is a toy project to learn Julia. It can be used to display a sequence of a Fibonacci numbers starting at a specific index.

## Usage

Assuming that the current directory is the project directory, use the following command:
> `julia --project=. -e "using Fib; main()" -- --help`

This will display some help of how to use the program

## Examples

> `julia --project=. -e "using Fib; main()" -- 10`

The above command will display the first 10 Fibonacci numbers while the following will display five numbers starting from the number at index 100.

> `julia --project=. -e "using Fib; main()" -- -i 100 5`
