all: pdf

pdf:
	wget https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/landfried2021.07.26-learning.pdf
	wget https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/landfried2021.07.26-aprendizaje.pdf

compile:
	make -C doc/

submodule:
	git submodule update --init ./
