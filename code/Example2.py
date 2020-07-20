import pandas as pd
import sys
from collections import defaultdict
sys.path.append('pathTTT/')
import TTT as th

# Import data
path = 'PathCSV/Example1.csv'
df = pd.read_csv(path)
# Define the enviroment
env = th.TrueSkill()
player = {}
ptrueskill = {}
# Default Values
print("Default mu, sigma, beta", env.mu, env.sigma, env.beta)
# Can define an other Prior
globalPrior = env.Rating(25, 25/3, 25/6)
# Loop for all the dataframe
for i in df.index:
    p1_key = str(df.loc[i].Player1)
    p2_key = str(df.loc[i].Player2)
    prior_1 = player.get(p1_key, globalPrior)
    prior_2 = player.get(p2_key, globalPrior)
    t1 = [prior_1]
    t2 = [prior_2]
    result = df.loc[i].Result
    game = env.Game([t1,t2], result)
    t1_post, t2_post = game.posterior
    player[p1_key]= t1_post[0]
    player[p2_key]= t2_post[0]
