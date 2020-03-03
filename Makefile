LATEX_FLAGS := -pdf -lualatex -cd -silent

.PHONY: all main open clean clean_aux

all: open

open: main
	@xdg-open out/main.pdf 2>/dev/null 1>/dev/null &

main: out/main.pdf

clean:
	rm -r out/

clean-aux:
	rm $(shell find out/* -not -type d -not -path out/main.pdf)

out/main.pdf: src/main.tex src/*.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)
