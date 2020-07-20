import TTT as th

env = th.TrueSkill(draw_probability=0)
team1 = [env.Rating()]
team2 = [env.Rating()]
result = [0, 1] # team2 wins
game = env.Game([team1,team2], result)
[[player1], [player2]] = game.posterior
print('posterior:', player1, 'mean:', player1.mu, 'variance:', player1.sigma)
