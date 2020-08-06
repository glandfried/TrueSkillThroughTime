import pandas as pd
import TTT as th

path = 'PathCSV/Example1.csv'
df = pd.read_csv(path)
env = th.TrueSkill()
player = {}
ptrueskill = {}

# Can define an other Prior
globalPrior = env.Rating(mu=25, sigma=25/3, beta=25/6)
for i in df.index:
    p1_key = str(df.loc[i].Player1)
    p2_key = str(df.loc[i].Player2)
    prior_1 = player.get(p1_key, globalPrior)
    prior_2 = player.get(p2_key, globalPrior)
    t1 = [prior_1.forget(1)]  # add noise to prior
    t2 = [prior_2.forget(1)]
    result = df.loc[i].Result
    game = env.Game([t1, t2], result)
    t1_post, t2_post = game.posterior
    player[p1_key] = t1_post[0]
    player[p2_key] = t2_post[0]
print(player)
