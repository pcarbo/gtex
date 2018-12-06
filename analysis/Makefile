# A Makefile for generating the results of the analyses.

all: ../output/gtexpca.out

codedir = ../code
outdir  = ../output

$(outdir)/gtexpca.out: gtexpca.R $(codedir)/gtexpca.functions.R
	R CMD BATCH gtexpca.R $(outdir)/gtexpca.out

clean:
	rm -f $(outdir)/gtexpca.out


