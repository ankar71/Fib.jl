using Fib
using Test
using OffsetArrays: Origin

@testset "Test Fib.fib" begin
    @test fib0(0x0)   == 0 
    @test fib(0x0001) == 1
    @test fib(0x03)   == 2
    @test fib(0x0A)   == 55


    @test fib0(0) == 0
    @test fib(1)  == 1
    @test fib(3)  == 2
    @test fib(10) == 55

    @test_throws DomainError fib(-1)

    @test safefib(100) == fib(100)
    @test safefib( 0)  === nothing
    @test safefib(-10) === nothing

end

@testset "Test Fib.fibseq" begin
    @test fibseq(0x0A) == BigInt[1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    @test fibseq(0x0A) == fibseq(10)
    @test_throws DomainError fibseq(-1)
    @test fibseq(0x2:0x5) == Origin(2)(BigInt[1, 2, 3, 5])
    @test fibseq(0x2:0x5) == fibseq(2:5)
    @test_throws DomainError fibseq(-2:5)

    @test safefibseq(-5:5) === nothing
    @test safefibseq(5:10) == fibseq(5:10)

    f100_102 = safefibseq(100:102)
    @test f100_102[100] == fib(100)
    @test f100_102[102] == fib(102)
end
