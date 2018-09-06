module ReinforcementLearningEnvironmentClassicControl
using GR
using ReinforcementLearningBase
export sample
import ReinforcementLearningBase: interact!, getstate, reset!, actionspace, plotenv

include("cartpole.jl")
include("mountaincar.jl")
include("pendulum.jl")

export CartPole, MountainCar, Pendulum,
       interact!, getstate, reset!, actionspace, plotenv

end # module
