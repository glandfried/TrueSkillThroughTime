include("meta/software/TrueSkill.jl/src/TrueSkill.jl")
using .TrueSkill
global ttt = TrueSkill

r1, r2 = ttt.Rating(), ttt.Rating()
r3, r4 = ttt.Rating(), ttt.Rating()
team_a = [ r1, r2 ]
team_b = [ r3, r4 ]
teams = [team_a, team_b]
result = [0,1]
g = ttt.Game(teams, result, 0.25)

diff = ttt.performance(team_a) - ttt.performance(team_b)
d = diff.mu
v = diff.sigma
evidencia = ttt.cdf(diff,0.0)

na = length(team_a)
nb = length(team_b)
sd = sqrt(na + nb)*ttt.BETA
p_draw = 0.25
margin = ttt.compute_margin(p_draw, sd)

tie = false
pd_ = ttt.trunc(diff,margin,tie)

approx_message = pd_/diff
d_div = approx_message.mu
v_div = approx_message.sigma

prior1 = r1.N
mu1 = prior1.mu
v2, v_div_2 = v^2, v_div^2
sigma1_2 = prior1.sigma^2
Lhood_s1_approx = ttt.Gaussian(mu = (mu1 - d + d_div), sigma = sqrt(v_div_2 + v2 - sigma1_2) )
posterior_s1_approx = prior1 * Lhood_s1_approx

s1 = ttt.posteriors(g)[1][1]
posterior_s1_approx 
