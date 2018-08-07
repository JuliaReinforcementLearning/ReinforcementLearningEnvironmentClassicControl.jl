# RLEnvClassicControl

[![Build Status](https://travis-ci.org/JuliaReinforcementLearning/RLEnvClassicControl.jl.svg?branch=master)](https://travis-ci.org/JuliaReinforcementLearning/RLEnvClassicControl.jl)

[![Coverage Status](https://coveralls.io/repos/JuliaReinforcementLearning/RLEnvClassicControl.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaReinforcementLearning/RLEnvClassicControl.jl?branch=master)

[![codecov.io](http://codecov.io/github/JuliaReinforcementLearning/RLEnvClassicControl.jl/coverage.svg?branch=master)](http://codecov.io/github/JuliaReinforcementLearning/RLEnvClassicControl.jl?branch=master)


Provides the classic CartPole MountainCar and Pendulum environment for the [Julia Reinforcement Learning package](https://github.com/JuliaReinforcementLearning/ReinforcementLearning.jl).

## Usage

```julia
using RLEnvClassicControl

environment = MountainCar()
environment = CartPole()
environment = Pendulum()
```

See also [examples](examples).


