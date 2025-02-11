let

if Base.find_in_path("Atom") == nothing
  println(STDERR, "Installing Atom.jl, hang tight...")
  Pkg.add("Atom")
end

port = parse(Int, shift!(ARGS))

pkgdir = joinpath(JULIA_HOME, "..", "pkg") |> normpath
vers = "v$(VERSION.major).$(VERSION.minor)"

if isdir(pkgdir)
  push!(LOAD_PATH, joinpath(pkgdir, vers))
  push!(Base.LOAD_CACHE_PATH, joinpath(pkgdir, "lib", vers))
  include("caches.jl")
end

using Atom
@sync Atom.connect(port)

end
