__precompile__()
module RLEnvClassicControl
using Reexport, GR
@reexport using ReinforcementLearning
import ReinforcementLearning: interact!, getstate, reset!, Box, plotenv

include("cartpole.jl")
include("mountaincar.jl")
include("pendulum.jl")

export CartPole, MountainCar, Pendulum
end # module
