import TTT as th
env = th.TrueSkill(draw_probability=0)
player1 = [env.Rating()]
player2 = [env.Rating()]
result = [0, 1]  # player1 wins
game = env.Game([player1, player2], result)
[[player1], [player2]] = game.posterior
print('Posterior:', player2, 'Mean:', player2.mu, 'Standard Desviation:', player2.sigma)
