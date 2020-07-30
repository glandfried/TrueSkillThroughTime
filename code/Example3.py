import TTT as th
import sys
sys.path.append('PathTTT/')

env = th.TrueSkill(draw_probability=0)
composition = [[["Stephen"], ["Gustavus"]], [["Gustavus"], ["Matt"]], [["Matt"], ["Stephen"]]]
results = [[0, 1], [0, 1], [0, 1]]
batch = ['2015-03', '2015-03', '2015-03']

history = env.history(composition, results, batch, batch_type='month', epsilon=1e-3)
history.status()  # Information of how the data upload(optional)
history.through_time(online=False)
history.convergence()
print(history.posteriors_player())
