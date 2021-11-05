module Isotropic

export bulk, young, lamé1st

bulk(; kwargs...) = bulk(NamedTuple(kwargs))
bulk((E, λ)::NamedTuple{(:E, :λ)}) = (E + 3 * λ + _auxiliaryR(E, λ)) / 6
bulk((E, G)::NamedTuple{(:E, :G)}) = E * G / (3 * (3 * G - E))
bulk((E, ν)::NamedTuple{(:E, :ν)}) = E / (3 * (1 - 2 * ν))
bulk((E, M)::NamedTuple{(:E, :M)}) = (3 * M - E + _auxiliaryS(E, M))
bulk((λ, G)::NamedTuple{(:λ, :G)}) = λ + 2 * G / 3
bulk((λ, ν)::NamedTuple{(:λ, :ν)}) = λ * (1 + ν) / 3 / ν
bulk((λ, M)::NamedTuple{(:λ, :M)}) = (M + 2 * λ) / 3
bulk((G, ν)::NamedTuple{(:G, :ν)}) = 2 * G * (1 + ν) / (3 * (1 - 2 * ν))
bulk((G, M)::NamedTuple{(:G, :M)}) = M - 4 * G / 3
bulk((ν, M)::NamedTuple{(:ν, :M)}) = M * (1 + ν) / (3 * (1 - ν))
bulk(x::NamedTuple) = haskey(x, :K) ? x[:K] : bulk(_reverse(x))

young(; kwargs...) = young(NamedTuple(kwargs))
young((K, λ)::NamedTuple{(:K, :λ)}) = 9 * K * (K - λ) / (3 * K - λ)
young((K, G)::NamedTuple{(:K, :G)}) = 9 * K * G / (3 * K + G)
young((K, ν)::NamedTuple{(:K, :ν)}) = 3 * K * (1 - 2 * ν)
young((K, M)::NamedTuple{(:K, :M)}) = 9 * K * (M - K) / (3 * K + M)
young((λ, G)::NamedTuple{(:λ, :G)}) = G * (3 * λ + 2 * G) / (λ + G)
young((λ, ν)::NamedTuple{(:λ, :ν)}) = λ * (1 + ν) * (1 - 2 * ν) / ν
young((λ, M)::NamedTuple{(:λ, :M)}) = (M - λ) * (M + 2 * λ) / (M + λ)
young((G, ν)::NamedTuple{(:G, :ν)}) = 2 * G * (1 + ν)
young((G, M)::NamedTuple{(:G, :M)}) = G * (3 * M - 4 * G) / (M - G)
young((ν, M)::NamedTuple{(:ν, :M)}) = M * (1 + ν) * (1 - 2 * ν) / (1 - ν)
young(x::NamedTuple) = haskey(x, :E) ? x[:E] : young(_reverse(x))

lamé1st(; kwargs...) = lamé1st(NamedTuple(kwargs))
lamé1st((K, E)::NamedTuple{(:K, :E)}) = (9K^2 - 3K * E) / (9K - E)
lamé1st((K, G)::NamedTuple{(:K, :G)}) = K - 2G / 3
lamé1st((K, ν)::NamedTuple{(:K, :ν)}) = 3K * ν / (1 + ν)
lamé1st((K, M)::NamedTuple{(:K, :M)}) = (3K - M) / 2
lamé1st((E, G)::NamedTuple{(:E, :G)}) = G * (E - 2G) / (3G - E)
lamé1st((E, ν)::NamedTuple{(:E, :ν)}) = E * ν / (1 + ν) / (1 - 2ν)
lamé1st((E, M)::NamedTuple{(:E, :M)}) = (M - E + _auxiliaryS(E, M)) / 4
lamé1st((G, ν)::NamedTuple{(:G, :ν)}) = 2G * ν / (1 - 2ν)
lamé1st((G, M)::NamedTuple{(:G, :M)}) = M - 2G
lamé1st((ν, M)::NamedTuple{(:ν, :M)}) = M * ν / (1 - ν)
lamé1st(x::NamedTuple) = haskey(x, :λ) ? x[:λ] : lamé1st(_reverse(x))
const lame1st = lamé1st

# These are helper functions and should not be exported!
_auxiliaryR(E, λ) = sqrt(E^2 + 9 * λ^2 + 2 * E * λ)
_auxiliaryS(E, M) = sqrt(E^2 + 9 * M^2 - 10 * E * M)

_reverse(x::NamedTuple) = (; zip(reverse(propertynames(x)), reverse(values(x)))...)

end
