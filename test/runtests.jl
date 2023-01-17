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
end
