module LinearElasticity

export Cubic, Hexagonal, Tetragonal, Trigonal, Orthorhombic, Monoclinic, Triclinic

"Represent one of the seven crystal systems."
abstract type CrystalSystem end
"""
    Triclinic()
Represent the triclinic system.
"""
struct Triclinic <: CrystalSystem end
"""
    Monoclinic()
Represent the monoclinic system.
"""
struct Monoclinic <: CrystalSystem end
"""
    Orthorhombic()
Represent the orthorhombic system.
"""
struct Orthorhombic <: CrystalSystem end
"""
    Tetragonal()
Represent the tetragonal system.
"""
struct Tetragonal <: CrystalSystem end
"""
    Cubic()
Represent the cubic system.
"""
struct Cubic <: CrystalSystem end
"""
    Trigonal()
Represent the trigonal system.
"""
struct Trigonal <: CrystalSystem end
"""
    Hexagonal()
Represent the hexagonal system.
"""
struct Hexagonal <: CrystalSystem end

include("SymmetryCriteria.jl")
# include("StabilityCriteria.jl")
include("Isotropic.jl")
include("misc.jl")
include("solve.jl")
include("ULICS.jl")

end
