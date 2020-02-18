HTML = index.html
# Get name of all Rmd files
DEPS = $(wildcard *.Rmd)

$(HTML): $(DEPS)
	Rscript -e "rmarkdown::render('01_head.Rmd', output_file = 'index.html')"
