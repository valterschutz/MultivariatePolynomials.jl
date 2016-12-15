@testset "Algebra" begin
    @polyvar x y
    @test 2 .- ((1.+(-x)) .* 4) ./ 2 == x.^2 .* (1 ./ x) .* 2
    @test dot(0, x^2 - 2*x^2) == dot((x^2 - x)', x^2 - x^2)
    @test 2 .* x .+ 2 == (x + 3) .+ (x .- 1)
    @test ((x + y) .- y) ./ y == x / y
    @test -2*x + dot(-x - x^2, 0) + MatPolynomial{Int}((i,j)->1, [1,x]) == -(-x^2 - 1)
    @test (-2)*x == -(2*x)
    @inferred x^2
    @inferred x^2-2x
    @inferred x+2x
    @inferred x^2-2x+2
    @inferred x^2-2x
    @inferred 2x+2
    @inferred (1+x)^0
    @inferred (1+x)^1
    @inferred (1+x)^2
    @inferred (1+x)^3
    @inferred (x^2)^0
    @inferred (x^2)^1
    @inferred (x^2)^2
    @inferred (x^2)^3
    @inferred (2x) * (3x)
    @inferred (2x)^0
    @inferred (2x)^1
    @inferred (2x)^2
    @inferred (2x)^3

    @test MultivariatePolynomials.iszero((x+x-2*x) * (x * (x^2 + y^2)))
    @test MultivariatePolynomials.iszero((0*x) * (x*y * (x^2 + y^2)))

    @testset "MatPolynomial" begin
        P = MatPolynomial{Int}((i,j) -> i + j, [x^2, x*y, y^2])
        p = VecPolynomial(P)
        @test !MultivariatePolynomials.iszero(P)
        @test MultivariatePolynomials.iszero(P-p)
        @test MultivariatePolynomials.iszero(p-P)
        @test P+P == P+p
        @test x*P == x*p
    end
end
