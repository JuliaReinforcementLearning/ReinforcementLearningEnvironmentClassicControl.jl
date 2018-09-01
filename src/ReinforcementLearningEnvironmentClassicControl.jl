__precompile__()
module ReinforcementLearningEnvironmentClassicControl
using GR, Compat
using ReinforcementLearningBase
import ReinforcementLearningBase: interact!, getstate, reset!, actionspace
export sample

include("cartpole.jl")
include("mountaincar.jl")
include("pendulum.jl")

export CartPole, MountainCar, Pendulum,
       interact!, getstate, reset!, actionspace

end # module
