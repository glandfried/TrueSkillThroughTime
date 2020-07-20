import TTT as th

env = th.TrueSkill(draw_probability=0)
team1 = [env.Rating()]
team2 = [env.Rating()]
result = [0, 1] # team2 wins
game = env.Game([team1,team2], result)
[[a], [b]] = game.posterior
print('posterior: ', a, 'mean: ', a.mu, 'variance: ', a.sigma)
