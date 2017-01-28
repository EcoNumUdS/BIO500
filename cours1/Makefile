inpu := $(wildcard *.Rmd)
inpr := $(wildcard scripts/*.R)
html = ./pres/index.html
pdf = ./pres/assets/pdf/S1-BIO109.pdf
deckpath = ~/Documents/Git/decktape

all: $(html)

$(html): $(inpu) $(inpr)
	rm -rf ./pres/.cache
	 cat *.Rmd > ./pres/index.Rmd
	Rscript --no-site-file --no-init-file scripts/get_slidify.R

$(pdf): $(html)
	$(deckpath)/phantomjs $(deckpath)/decktape.js -s 1280x720 --loadPause=5000 $(html) $(pdf)

clean:
	rm -rf pres/.cache pres/index.*
