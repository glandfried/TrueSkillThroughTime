import sys
sys.path.append('PathTTT/')
import time
from line_profiler import LineProfiler
import cProfile, pstats, io
import TTT as thM
from importlib import reload

reload(thM)
envM = thM.TrueSkill(draw_probability=0)
composition = [[["carlos"],["Jorge"]], [["Jorge"],["Luis"]], [["Luis"],["carlos"]]]
results = [[0,1], [0,1], [0,1]]
batch = ['2015-03','2015-03','2015-03']

historyM = envM.history(composition, results, batch,batch_type='month',iterations =10, epsilon=1e-19)
# Information of how the data upload
historyM.status()
# Define all variables and make the first TrueSkill pass
historyM.through_time(online=False)
# Makes convergence in each batch and pass Information back and foward till convergence
historyM.convergence()
# Print last posterior of each player
print(historyM.posteriors_player())
