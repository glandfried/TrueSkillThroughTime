## TrueSkill Through Time: the state-of-the-art skill model.

_Individual learning curves with good initial estimates and guaranteed comparability between distant estimates._

This is a repository containing a complete theoretical documentation of the TrueSkill Through Time model.
The packages are just attached as submodules.

## Packages 

If you are looking for the [`Julia` package](https://github.com/glandfried/TrueSkillThroughTime.jl), go to:
    
    github.com/glandfried/TrueSkillThroughTime.jl

If you are looking for the [`python` package](https://github.com/glandfried/TrueSkillThroughTime.py), go to:
    
    github.com/glandfried/TrueSkillThroughTime.py

If you are looking for the [`R` package](https://github.com/glandfried/TrueSkillThroughTime.R), go to:
    
    github.com/glandfried/TrueSkillThroughTime.R

### Computational details
    
The `Julia` package is the most efficient, ten times faster than our `Python` package.
Our `Python` package is also efficient, ten times faster than the original `trueskill 0.4.5` (Lee 2012) package.
In contrast, our `R` package is slower than the other packages, including the original `trueskill 0.4.5` package.

### Issues

Since we have three packages (Julia, Python and R) and one article, we have four repositories to open an issue.
You must decide where to do it according to the type of question, if it is particular to the implementation of one of the packages or if it is general related to theoretical issues.

## Technical documentation

You can find the full scientific documentation of TrueSkill Through Time packages at:

0.  English. [Last version](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc/landfried-learning.pdf) 2022-10-31
0.  Español. [Última versión](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc/landfried-aprendizaje.pdf) 2022-10-31

Our paper explains all the theoretical details involved in the original [TrueSkill](https://www.microsoft.com/en-us/research/wp-content/uploads/2007/01/NIPS2006_0688.pdf) and [TrueSkill Through Time](https://www.microsoft.com/en-us/research/wp-content/uploads/2008/01/NIPS2007_0931.pdf) papers.

Special thanks to its authors: [Ralf Herbrich](https://herbrich.me/), [Tom Minka](tminka.github.io), [Thore Graepel](thoregraepel.github.io), and Pierre Dangauthier.

### The History of the ATP

Humans develop complex skills through time.
The most commonly used skill estimators in industry and academia cannot obtain reliable initial estimates or guarantee comparability between estimates distant in time and space.
The model TrueSkill Through Time (TTT) propagates all historical information throughout a single causal network, providing estimates with low uncertainty at any given time, enabling reliable initial skill estimates, and ensuring historical comparability.

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

Special thanks to the authors of the original paper [Ralf Herbrich](https://herbrich.me/), [Tom Minka](tminka.github.io), [Thore Graepel](thoregraepel.github.io), and Pierre Dangauthier.
And special thanks to Heungsub Lee for having published the [basic TrueSkill model in Python](https://github.com/sublee/trueskill).
