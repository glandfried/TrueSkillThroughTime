all: pdf

pdf:
	wget https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/article-en.pdf
	wget https://github.com/glandfried/TrueSkillThroughTime/releases/download/doc.0.0.0/article-es.pdf

compile:
	make -C doc/

submodule:
	git submodule update --init ./
