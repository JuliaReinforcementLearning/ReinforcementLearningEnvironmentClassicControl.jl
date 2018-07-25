# RLEnvClassicControl

[![Build Status](https://travis-ci.org/jbrea/RLEnvClassicControl.jl.svg?branch=master)](https://travis-ci.org/jbrea/RLEnvClassicControl.jl)

[![Coverage Status](https://coveralls.io/repos/jbrea/RLEnvClassicControl.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/jbrea/RLEnvClassicControl.jl?branch=master)

[![codecov.io](http://codecov.io/github/jbrea/RLEnvClassicControl.jl/coverage.svg?branch=master)](http://codecov.io/github/jbrea/RLEnvClassicControl.jl?branch=master)


Provides the classic CartPole MountainCar and Pendulum environment for the [Julia Reinforcement Learning package](https://github.com/jbrea/ReinforcementLearning.jl).

## Usage

```julia
using RLEnvClassicControl

environment = MountainCar()
environment = CartPole()
environment = Pendulum()
```

See also [examples](examples).


