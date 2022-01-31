#using Pkg
#Pkg.add("TrueSkillThroughTime")
using CSV
using Dates
using DataFrames
using TrueSkillThroughTime
global const ttt = TrueSkillThroughTime
using DataFrames


function optimize(composition,days; sigma= [], gamma=[], iterations=1, p_draw = [0.0], results = Array{Array{Float64,1},1}())
    res = []
    for pd in p_draw
        push!(res,[])
        for s in sigma
            push!(res[end],[])
            for g in gamma
                h = ttt.History(composition=composition, times = days, results = results, sigma = s, gamma = g, online=true, iterations = iterations, p_draw = pd)
                push!(res[end][end],exp(ttt.log_evidence(h)/h.size))
            end
        end
    end
    return res
end


function trainset(path, cutoff)
    data = CSV.read(path, DataFrame)
    train = data[Dates.DateTime(cutoff, "yyyy-mm-dd") .> unix2datetime.(data[:,"t"]),:]
    train, data
end

function days_number(data)
    days = Dates.Date.(unix2datetime.(data[:,"t"])) .- Dates.Date(1970,01,01)
    return Dates.value.(days)
end

# function pMD(gmean_pDM,N)#gmean_pDM = opt; N = 20300
#     # EN CASO DE QUERER INTEGRAR, TERMINAR
#     log_pd_M = [ [ [ log(g)*N for g in s] for s in d] for d in gmean_pDM ]
#     K = maximum(maximum(log_pd_M))
#     log_pd_M = [ [ [ log(g)*N-K for g in s] for s in d] for d in gmean_pDM ]
# end

# # open("output/ttt_online.log", "w") do file
# #     println(file,"database, rate_train, n_train, rate_test, n_test, sigma, gamma, p_draw")
# # end

### TENNIS

cutoff =  "2011-08-28"
train, data = trainset("input/kdd-tennis.csv", cutoff)
days = days_number.([train,data])
comp(base) = begin [[[r.winner],[r.loser]] for r in eachrow(base)] end
composition = comp.([train,data])
#les = optimize(composition[1], days[1], sigma=[0.88, 0.89, 0.90,0.91], gamma=[0.024, 0.025, 0.026],iterations=1)
#  Any[0.5478972729077543, 0.5479102932992185, 0.5479029618522271]
#  Any[0.547898906150966,  0.5479112843606984, 0.5479033850853688]
#  Any[0.5478998189368054, 0.5479115773295057, 0.5479031310693696]
#                          0.5479111887700518
sigma = 0.90; gamma = 0.025; p_draw = 0.0

N_BATCHES = length(unique(days[1]))
N_TRAIN = length(days[1])
N_TEST = length(days[2]) - length(days[1])

h = ttt.History(composition=composition[2], times = days[2], sigma = sigma, gamma = gamma, online=true, iterations = 1)
le = [ttt.log_evidence2(b, h.online, agents = Vector{String}(), forward=false) for b in h.batches]

rate_train = exp(sum(le[1:N_BATCHES])/N_TRAIN)
rate_test = exp(sum(le[N_BATCHES+1:end])/(N_TEST))

open("output/ttt_online.log", "a") do file
    println(file, "kdd-tennis, ", rate_train, ", ", N_TRAIN, ", ", rate_test, ", ", N_TEST, ", ", sigma, ", ", gamma, ", ", p_draw)
end

### BASKET

cutoff =  "2003-03-15"
train, data = trainset("input/kdd-basketball.csv", cutoff)
days = days_number.([train,data])
comp(base) = begin [ r.score1 > r.score2 ? [[r.team1],[r.team2]] : [[r.team2],[r.team1]] for r in eachrow(base) ] end
composition = comp.([train,data])
sigma = 0.49; gamma = 0.02; p_draw = 0.0
#les = optimize(composition[1], days[1], sigma=[0.48,0.49,0.5], gamma=[0.019,0.02,0.021], iterations=1)
#0.48 0.019 0.02 0.021
#0.49 0.019 0.02 0.021
#0.5  0.019 0.02 0.021
# Any[
# Any[Any[0.5300966050075346, 0.5301072141639728, 0.5300950641424619]]
# Any[Any[0.5300968586973746, 0.5301075416409315, 0.5300954546929915]]
# Any[Any[0.5300966233340161, 0.5301073856124675, 0.5300953676912603]]]


N_BATCHES = length(unique(days[1]))
N_TRAIN = length(days[1])
N_TEST = length(days[2]) - length(days[1])

h = ttt.History(composition=composition[2], times = days[2], sigma = sigma, gamma = gamma, online=true, iterations = 1)
le = [ttt.log_evidence2(b, h.online, agents = Vector{String}(), forward=false) for b in h.batches]
rate_train = exp(sum(le[1:N_BATCHES])/N_TRAIN)
rate_test = exp(sum(le[N_BATCHES+1:end])/(N_TEST))

open("output/ttt_online.log", "a") do file
    println(file, "kdd-basketball, ", rate_train, ", ", N_TRAIN, ", ", rate_test, ", ", N_TEST, ", ", sigma, ", ", gamma, ", ", p_draw)
end

### CHESS

cutoff = "1974-04-15"
train, data = trainset("input/kdd-chess-small.csv", cutoff)
days = days_number.([train,data])
comp(base) = begin composition = [  [[r.black],[r.white]] for r in eachrow(base) ] end
resu(base) = begin [ r.winner == "tie" ? [0.,0.] : ( r.winner == "black" ? [1.,0.] : [0.,1.] ) for r in eachrow(base) ] end
composition = comp.([train,data]); results = resu.([train,data])
sigma=0.90;gamma=0.007
#les = optimize(composition[1], days[1], results = results[1], sigma=[0.89, 0.90,0.91], gamma=[0.006, 0.007, 0.008],p_draw=[0.42,0.43,0.44] ,iterations=1)
# 0.43[0.88[0.005 0.007 ]
#      0.90[      0.007 0.009]
#      0.92[0.005 0.007 ]
#  Any[    0.36277309361367627, 0.36287709859228684]]
#      Any[                     0.3628829507110859, 0.3628382181496942]]
#Any[Any[   0.3627830461288194, 0.36288208949382783]]
p_draw = 0.43


N_BATCHES = length(unique(days[1]))
N_TRAIN = length(days[1])
N_TEST = length(days[2]) - length(days[1])

h = ttt.History(composition=composition[2], times = days[2], results = results[2], sigma = sigma, gamma = gamma, p_draw = p_draw, online=true, iterations =1)
le = [ttt.log_evidence2(b, h.online, agents = Vector{String}(), forward=false) for b in h.batches]
rate_train = exp(sum(le[1:N_BATCHES])/N_TRAIN)
rate_test = exp(sum(le[N_BATCHES+1:end])/(N_TEST))

open("output/ttt_online.log", "a") do file
    println(file, "kdd-chess-small, ", rate_train, ", ", N_TRAIN, ", ", rate_test, ", ", N_TEST, ", ", sigma, ", ", gamma, ", ", p_draw)
end
    
### FOTBALL

cutoff = "2011-06-03"
train, data = trainset("input/kdd-football.csv", cutoff)
days = days_number.([train,data])
comp(base) = begin [[[r.team1],[r.team2]] for r in eachrow(base)] end
resu(base) = begin [ r.score1 == r.score2 ? [0.,0.] : ( r.score1 > r.score2 ? [1.,0.] : [0.,1.] ) for r in eachrow(base) ] end
composition = comp.([train,data]); results = resu.([train,data])
p_draw = 0.3
sigma=1.36;gamma=0.006
# les = optimize(composition[1], days[1], results = results[1], sigma=[1.34,1.36,1.38], gamma=[0.005,0.006,0.007], p_draw= [0.29,0.30,0.31], iterations=1)
# Any[
# Any[0.39341913438520953, 0.3934766225358919, 0.3934084725680924], 
# Any[0.39341974069981933, 0.39347579137260025, 0.3934063727327976], 
# Any[0.3934189501416254, 0.39347366832639236, 0.3934030672479937]]
# Any[
# Any[0.3934729125083729, 0.393551515239136, 0.39350318174001386], 
# Any[0.3934747227025729, 0.3935518446415884, 0.3935022012960445], 
# Any[0.39347510323654633, 0.3935508515086631, 0.39349998642592765]]
# Any[
# Any[0.3933847327854246, 0.3934848247695359, 0.39345670770856334], 
# Any[0.3933877669959983, 0.3934863346341967, 0.3934568663284508], 
# Any[0.3933893386853543, 0.3934864912777358, 0.3934557617067179]]

#les = optimize(composition[1], days[1], results = results[1], sigma=[1.39,1.41], gamma=[0.006], p_draw= [0.30], iterations=1)
#Any[Any[0.39354987821681275], Any[0.3935470150577938]]

#les = optimize(composition[1], days[1], results = results[1], sigma=[1.34,1.36, 1.38], gamma=[0.006], p_draw= [0.30], iterations=1)
Any[Any[0.39354979912956817], Any[0.393551515239136], Any[0.3935518446415884], Any[ 0.39355122038545504]]



N_BATCHES = length(unique(days[1]))
N_TRAIN = length(days[1])
N_TEST = length(days[2]) - length(days[1])

h = ttt.History(composition=composition[2], times = days[2], results=results[2], sigma = sigma, gamma = gamma, p_draw = p_draw, online=true, iterations =1)
le = [ttt.log_evidence2(b, h.online, agents = Vector{String}(), forward=false) for b in h.batches]
rate_train = exp(sum(le[1:N_BATCHES])/N_TRAIN)  
rate_test = exp(sum(le[N_BATCHES+1:end])/(N_TEST))

open("output/ttt_online.log", "a") do file
    println(file, "kdd-football, ", rate_train, ", ", N_TRAIN, ", ", rate_test, ", ", N_TEST, ", ", sigma, ", ", gamma, ", ", p_draw)
end
