# A Makefile for generating the results of the analyses.

codedir = ../code
outdir  = ../output

all: $(outdir)/gtexpca.out \
     $(outdir)/gtexpca.png

$(outdir)/gtexpca.out $(outdir)/gtexpca.png: gtexpca.R \
                                             $(codedir)/gtexpca.functions.R
	R CMD BATCH --no-save gtexpca.R $(outdir)/gtexpca.out

clean:
	rm -f $(outdir)/gtexpca.out 
	rm -f $(outdir)/gtexpca.png


