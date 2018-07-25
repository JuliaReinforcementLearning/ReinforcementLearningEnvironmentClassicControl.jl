__precompile__()
module RLEnvClassicControl
using Reexport
@reexport using ReinforcementLearning
import ReinforcementLearning: interact!, getstate, reset!, Box

include("cartpole.jl")
include("mountaincar.jl")
include("pendulum.jl")

export CartPole, MountainCar, Pendulum
end # module
