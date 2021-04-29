import pandas as pd
import TTT as th

env = th.TrueSkill(draw_probability=0)
path = 'PathCSV/Example1.csv'
df = pd.read_csv(path)
composition = [[[p1], [p2]] for p1, p2 in zip(df.Player1, df.Player2)]
results = list(df.Result.map(lambda x: [1, 0] if x=='[1, 0]' else [0, 1]))
history = env.history(composition, results)
history.trueskill()
print(history.posteriors_player())
