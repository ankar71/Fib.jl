using Fib
using Test

@testset "Test Fib.fib" begin
    @test fib(0x0)    == 0
    @test fib(0x0001) == 1
    @test fib(0x03)   == 2
    @test fib(0x0A)   == 55


    @test fib(0)  == 0
    @test fib(1)  == 1
    @test fib(3)  == 2
    @test fib(10) == 55

    @test_throws DomainError fib(-1)

end

@testset "Test Fib.fib_seq" begin
    @test fib_seq(0x0A)[0:10] == BigInt[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    @test fib_seq(0x0A) == fib_seq(10)
    @test_throws DomainError fib_seq(-1)
    @test fib_seq(0x2:0x5) == BigInt[1, 2, 3, 5]
    @test fib_seq(0x2:0x5) == fib_seq(2:5)
    @test_throws DomainError fib_seq(-2:5)

end
