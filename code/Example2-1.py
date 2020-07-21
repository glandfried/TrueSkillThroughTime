import sys
sys.path.append('pathTTT/')
import TTT as th
import pandas as pd

env = th.TrueSkill(draw_probability=0)
path = 'PathCSV/Example1.csv'
df = pd.read_csv(path)
composition = [[[p1], [p2]] for p1, p2 in zip(df.Player1, df.Player2)]
results = list(df.Result.map(lambda x: [1, 0] if x else [0, 1]))

history = env.history(composition, results, batch_numbers=None)
history.through_time(online=False)
print(history.posteriors_player())
