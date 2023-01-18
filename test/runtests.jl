using Fib
using Test

@testset "Fib.jl" begin
    @test fib(0x0)    == 0
    @test fib(0x0001) == 1
    @test fib(0x03)   == 2
    @test fib(0x0A)   == 55


    @test fib(0)  == 0
    @test fib(1)  == 1
    @test fib(3)  == 2
    @test fib(10) == 55

    @test_throws DomainError fib(-1)


    # basic sequence
    fs = fib_seq(0x0A)
    @test fs[0] == fib(0)
    @test fs[1] == fib(1)
    @test fs[2] == fib(2)
    @test fs[5] == fib(5)

    # various sequences
    @test fib_seq(0x0A) == fib_seq(10)
    @test_throws DomainError fib_seq(-1)
    @test fib_seq(0x2:0x5) == [BigInt(1), 2, 3, 5]
    @test fib_seq(0x2:0x5) == fib_seq(2:5)
    @test_throws DomainError fib_seq(-2:5)

end
