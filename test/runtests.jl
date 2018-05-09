using Base.Test
using BCBI_base

@testset "Registered" begin
    install_registered()
    failed_pkgs = Vector{String}()

    for pkg in BCBI_base.registered_pkgs
        println("--------------------------------")
        println("Package: ", pkg)
        println("--------------------------------")
        try
            pkgsym = Symbol(pkg)
            eval(:(using $pkgsym))
        catch
            warn("using pkg failed")
            push!(failed_pkgs, pkg)
        end
    end

    println("--------------------------------")
    println("Failed packages: ")
    map(x->println(x), failed_pkgs)
    println("--------------------------------")

    @test length(failed_pkgs) == 0
end

@testset "Unregistered" begin
    install_unregistered()
    failed_pkgs = Vector{String}()

    for pkg in BCBI_base.unregistered_pkgs
        println("--------------------------------")
        println("Package: ", pkg)
        println("--------------------------------")
        try
            pkgsym = Symbol(pkg)
            eval(:(using $pkgsym))
        catch
            warn("using pkg failed")
            push!(failed_pkgs, pkg)
        end
    end

    println("--------------------------------")
    println("Failed packages: ")
    map(x->println(x), failed_pkgs)
    println("--------------------------------")

    @test length(failed_pkgs) == 0
end