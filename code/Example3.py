import TTT as th
import sys
sys.path.append('PathTTT/')

env = th.TrueSkill(draw_probability=0)
composition = [[["Stephen"], ["Gustavus"]], [["Gustavus"], ["Matt"]], [["Matt"], ["Stephen"]]]
results = [[0, 1], [0, 1], [0, 1]]
# We make a temporal batch that is in the same year, same month.
batch = ['2015-03', '2015-03', '2015-03']
# We pass the information that we want a batch of month
history = env.history(composition, results, batch, batch_type='month', epsilon=1e-3)
# Information of how the data upload
history.status()
# Define all variables and make the first TrueSkill pass
history.through_time(online=False)
# Makes convergence in each batch and pass Information back and foward till convergence
history.convergence()
# Print last posterior of each player
print(history.posteriors_player())
