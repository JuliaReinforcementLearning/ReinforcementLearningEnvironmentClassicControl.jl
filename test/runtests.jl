using RLEnvClassicControl
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

import RLEnvClassicControl: reset!, interact!, getstate
for x in [CartPole, MountainCar, Pendulum]
    env = x()
    reset!(env)
    @test typeof(interact!(1, env)) == Tuple{Array{Float64, 1}, Float64, Bool}
    @test typeof(getstate(env)) == Tuple{Array{Float64, 1}, Bool}
end
