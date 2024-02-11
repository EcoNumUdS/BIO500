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
	Rscript -e 'if (!require(rmarkdown)) install.packages("rmarkdown"); if (!require(knitr)) install.packages("knitr"); if (!require(xaringan)) install.packages("xaringan"); if (!require(RSQLite)) install.packages("RSQLite"); if (!require(RPostgreSQL)) install.packages("RPostgreSQL"); if (!require(ggplot2)) install.packages("ggplot2"); if (!require(reshape2)) install.packages("reshape2");'

clean:
	rm $(HTML)

.PHONY: all $(BLOCS) deploy install clean
