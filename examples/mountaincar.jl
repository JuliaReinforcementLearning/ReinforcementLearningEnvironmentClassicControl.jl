using RLEnvClassicControl

env = MountainCar()
rlsetup = RLSetup(ActorCriticPolicyGradient(ns = 2, na = 3, α = .02, 
                                            nsteps = 25), 
                  env, ConstantNumberSteps(400), 
                  callbacks = [Visualize(wait = .02)])
info("Before learning.") 
run!(rlsetup)
rlsetup.callbacks = [EvaluationPerEpisode(TotalReward())]
rlsetup.stoppingcriterion = ConstantNumberSteps(10^5)
learn!(rlsetup)
getvalue(rlsetup.callbacks[1])
info("After learning.")
rlsetup.callbacks = [Visualize(wait = .02)]
rlsetup.stoppingcriterion = ConstantNumberSteps(400)
run!(rlsetup)
