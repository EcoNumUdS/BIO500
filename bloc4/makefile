HTML = index.html
RMD = index.Rmd
# Get name of all Rmd files (exept index.Rmd)
DEPS = $(filter-out $(RMD), $(wildcard *.Rmd))

$(HTML): $(RMD)
	Rscript -e "rmarkdown::render('$<')"

$(RMD): $(DEPS)
	cat *.Rmd | grep -v index.Rmd > $@
