using IntervalArithmetic
using LazySets
using Plots
using LaTeXStrings
const IA = IntervalArithmetic
include("draw-1D.jl")
include("wheels.jl")
include("comp-details.jl")
include("onestep.jl")

# STL formula: Phi = (F[0,8] x ∈ Omega) ∧ (G[11,15] x ∈ Omega)

X = IA.interval(0, 45)
U = IA.interval(0, 1)
Omega = LazySets.Interval([20,25])

X_2_fz, X_1and2_fz = off_comp(1)
X_2_sat, X_1and2_sat = off_comp(2)

draw(X_2_fz, X_1and2_fz, X_2_sat, X_1and2_sat)
Plots.png("figure_case1_offlineresults")
draw_lines()
Plots.png("figure_case1")
