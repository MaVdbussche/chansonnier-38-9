LATEX_FLAGS := -pdf -lualatex -cd -silent

.PHONY: all main open clean clean_aux

all: open

open: main
	@xdg-open build_latex/main.pdf 2>/dev/null 1>/dev/null &

main: build_latex/main.pdf

clean:
	rm -r build_latex/*

clean-aux:
	rm $(shell find build_latex/* -not -type d -not -path build_latex/main.pdf)

build_latex/examples/structure/main.pdf: src/examples/structure/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/examples/title/main.pdf: src/examples/title/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/1/main.pdf: src/exercices/1/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/2/main.pdf: src/exercices/2/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/3/main.pdf: src/exercices/3/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/exercices/bib/main.pdf: src/exercices/bib/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)

build_latex/main.pdf: src/main.tex
	@echo -e "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=$(PWD)/$(@D) $< $(BASH_POSTPROCESSING)
