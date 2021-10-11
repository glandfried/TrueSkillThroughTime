## TrueSkill Through Time: the Julia, Python and R packages.

Humans develop complex skills through time.
Knowing how individual abilities change is essential in a wide range of activities.
Most estimators implemented for the video game industry cannot obtain reliable initial estimates nor guarantee comparability between distant estimates.

TrueSkill Through Time solves all these problems by modeling the entire history of activities using a single Bayesian network.
This algorithm requires a few iterations to converge, allowing millions of observations to be analyzed using any low-end computer.

To support the use of reliable learning estimators, we provide the first implementations of TrueSkill Through Time for  `Julia`, `Python` and `R`.
A complete scientific documentation allows scientists to make sense of all epistemological and technical aspects of the estimation process.

### Scientific article

You can find the full scientific documentation of TrueSkill Through Time packages at:

0.  English. [Last version](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc/landfried-learning.pdf) 2021-07-26
0.  Español. [Última versión](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc/landfried-aprendizaje.pdf) 2021-07-26

### Packages

0. Julia Package: [https://github.com/glandfried/TrueSkillThroughTime.jl](https://github.com/glandfried/TrueSkillThroughTime.jl)
0. Python Package: [https://github.com/glandfried/TrueSkillThroughTime.py](https://github.com/glandfried/TrueSkillThroughTime.py)
0. R package: [https://github.com/glandfried/TrueSkillThroughTime.R](https://github.com/glandfried/TrueSkillThroughTime.R)

### Computational details

Our Python package solves individual events ten times faster than the original trueskill 0.4.5 (Lee 2012) package.
In turn, our Julia package converge a history of events ten times faster than our Python package.
In contrast, our R package is slower than the other packages, including the original trueskill 0.4.5
package.

### The History of the ATP

The following figure presents **the learning curves of some famous players in ATP history**.
A one-point difference between skills is equivalent to 76% probability of winning.
The top bar indicates which player was at the top of the ATP’s ranking.

![atp](static/atp.png)

It is possible recognize the periods of crisis, stability and success of the players, even the effect of emotional slumps such as those that Aggasi and Djockovic had.
The skill of tennis players did not increase so much over the years: on the contrary the players of the 1980s were more skilled than those of the 1990s, and reached a skill similar to what Federer, Nadal and Djokovic had in 2020.

There is a relative coincidence between skill and who is at any given moment at the top of the ATP rankings.
However, TrueSkill Through Time allows comparing the relative ability of players over time: the 10th player in the historical ATP's ranking, Hewitt, is a product of the window of opportunity that was opened in the year 2000; and the 4th most skilled player, Murray, is ranked 14th just above Nastase.

The **models commonly used in industry and academia** (TrueSkill, Glicko, Item-Response Theory) are based on an ad-hoc solution that prevents them both from having good initial estimates and from guaranteeing comparability between estimates separated in time.

![atp](static/atp_trueskill.png)

The advantage of TrueSkill Through Time lies in its temporal causal model, that links all historical activities in the same Bayesian network, which guarantees both good initial estimates and the temporal and spatial comparability of the estimates.

### Acknowledgments

Special thanks to Heungsub Lee for having published the [basic TrueSkill model in Python](https://github.com/sublee/trueskill).
