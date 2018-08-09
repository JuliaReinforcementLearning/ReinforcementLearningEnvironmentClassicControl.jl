struct MountainCarParams{T}
    minpos::T
    maxpos::T
    maxspeed::T
    goalpos::T
    maxsteps::Int64
end
mutable struct MountainCar{T}
    params::MountainCarParams{T}
    observation_space::Box{T}
    state::Array{T, 1}
    done::Bool
    t::Int64
end
function MountainCar(; T = Float64, minpos = T(-1.2), maxpos = T(.6),
                       maxspeed = T(.07), goalpos = T(.5), maxsteps = 200)
    env = MountainCar(MountainCarParams(minpos, maxpos, maxspeed, goalpos,
                                        maxsteps),
                      Box([minpos, -maxspeed], [maxpos, maxspeed]),
                      zeros(T, 2),
                      false, 0)
    reset!(env)
    env
end

function getstate(env::MountainCar)
    env.state, env.done
end
function reset!(env::MountainCar{T}) where T
    env.state[1] = .2 * rand(T) - .6
    env.state[2] = 0.
    env.done = false
    env.t = 0
    env.state
end

function interact!(a, env::MountainCar)
    if env.done
        reset!(env)
        return env.state, -1., env.done
    end
    env.t += 1
    x, v = env.state
    v += (a - 2)*0.001 + cos(3*x)*(-0.0025)
    v = clamp(v, -env.params.maxspeed, env.params.maxspeed)
    x += v
    x = clamp(x, env.params.minpos, env.params.maxpos)
    if x == env.params.minpos && v < 0 v = 0 end
    env.done = x >= env.params.goalpos || env.t >= env.params.maxsteps
    env.state[1] = x
    env.state[2] = v
    env.state, -1., env.done
end

# adapted from https://github.com/JuliaML/Reinforce.jl/blob/master/src/envs/mountain_car.jl
height(xs) = sin(3 * xs)*0.45 + 0.55
rotate(xs, ys, θ) = xs*cos(θ) - ys*sin(θ), ys*cos(θ) + xs*sin(θ)
translate(xs, ys, t) = xs + t[1], ys + t[2]
function plotenv(env::MountainCar, s, a, r, d)
    clearws()
    setviewport(0, 1, 0, 1)
    setwindow(env.params.minpos - .1, env.params.maxpos + .2, -.1,
              height(env.params.maxpos) + .2)
    xs = linspace(env.params.minpos, env.params.maxpos, 100)
    ys = height.(xs)
    polyline(xs, ys)
    x = s[1]
    θ = cos(3*x)
    carwidth = 0.05
    carheight = carwidth/2
    clearance = .2*carheight
    xs = [-carwidth/2, -carwidth/2, carwidth/2, carwidth/2]
    ys = [0, carheight, carheight, 0]
    ys += clearance
    xs, ys = rotate(xs, ys, θ)
    xs, ys = translate(xs, ys, [x, height(x)])
    fillarea(xs, ys)
    plotendofepisode(env.params.maxpos + .1, 0, d) 
    updatews()
end
