import TTT as thM
from importlib import reload
import sys

sys.path.append('PathTTT/')
reload(thM)
envM = thM.TrueSkill(draw_probability=0)
composition = [[["Stephen"], ["Gustavus"]], [["Gustavus"], ["Matt"]], [["Matt"], ["Stephen"]]]
results = [[0, 1], [0, 1], [0, 1]]
batch = ['2015-03', '2015-03', '2015-03']

historyM = envM.history(composition, results, batch, batch_type='month')
# Information of how the data upload
historyM.status()
# Define all variables and make the first TrueSkill pass
historyM.through_time(online=False)
# Makes convergence in each batch and pass Information back and foward till convergence
historyM.convergence()
# Print last posterior of each player
print(historyM.posteriors_player())
