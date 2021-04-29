## TrueSkill Through Time: the Julia, Python and R packages.

Humans develop complex skills through time.
Estimating them is essential in education, labor and sports systems.
However, it is a sensitive issue when they are intended to be used to make decisions that may impact individuals.

None of the widely used skill estimators, such as TrueSkill, Glicko and Item-Response Theory, correctly models the temporal aspect, which prevents having both good initial estimates and comparability between estimates separated in time and space.

TrueSkill Through corrects those biases by modeling the entire history of activities using a single Bayesian network.
The use of an efficient algorithm, that requires only a few linear iterations over the data, allows scaling to millions of observations in few seconds.

In this paper we offer the first packages for \proglang{Julia}, \proglang{Python}, and \proglang{R}, together with its scientific documentation, supporting the use of reliable learning curve estimators.

![ss](static/atp.png)

### Scientific article

Full scientific documentation of the Julia, Python and R packages of the Bayesian skill estimator TrueSkill Through Time.

0.  [English version](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/article-en.pdf)

0.  [Versión en español](https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/article-es.pdf)

### Packages

0. Julia Package: [https://github.com/glandfried/TrueSkillThroughTime.jl](https://github.com/glandfried/TrueSkillThroughTime.jl)
0. Python Package: [https://github.com/glandfried/TrueSkillThroughTime.py](https://github.com/glandfried/TrueSkillThroughTime.py)
0. R package: [https://github.com/glandfried/TrueSkillThroughTime.R](https://github.com/glandfried/TrueSkillThroughTime.R)




