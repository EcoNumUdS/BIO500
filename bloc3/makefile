HTML = index.html
# Get name of all Rmd files
DEPS = $(wildcard *.Rmd)
# local assets
lASSETS := $(shell find assets)
# global assets
gASSETS := $(shell find ../assets)

# assets
$(HTML): $(DEPS) $(lASSETS) $(gASSETS)
	Rscript -e "rmarkdown::render('01_head.Rmd', output_file = 'index.html')"
