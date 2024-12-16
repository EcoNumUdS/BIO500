# Get name of main folders (bloc..)
BLOCS = $(wildcard bloc*)
# append the html and Rmd file for each main folder (targets)
HTML = $(addsuffix /index.html, $(BLOCS))


all: $(BLOCS)

# run make for each subdirectory (blocs)
$(BLOCS):
	$(MAKE) -C $@

deploy:
	mkdir slides
	cp -r ./assets ./slides
	for dir in $(BLOCS) ; do \
			mkdir -p ./slides/$$dir ; \
			cp ./$$dir/index.html ./slides/$$dir ; \
			cp -r ./$$dir/assets ./slides/$$dir ; \
			if [ -d "./$$dir/index_files" ]; then cp -r ./$$dir/index_files ./slides/$$dir; fi ; \
	done

install:
	Rscript -e 'if (!require(pak)) install.packages("pak"); if (!require(rmarkdown)) pak::pak("rmarkdown"); if (!require(knitr)) pak::pak("knitr"); if (!require(xaringan)) pak::pak("xaringan"); if (!require(RSQLite)) pak::pak("RSQLite"); if (!require(RPostgreSQL)) pak::pak("RPostgreSQL"); if (!require(ggplot2)) pak::pak("ggplot2"); if (!require(reshape2)) pak::pak("reshape2"); if (!require(knitr)) pak::pak("knitr"); if (!require(sf)) pak::pak("sf"); if (!require(terra)) pak::pak("terra");'

clean:
	rm $(HTML)

.PHONY: all $(BLOCS) deploy install clean
