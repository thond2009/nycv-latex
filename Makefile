.PHONY: examples myprj

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

MYPRJ_DIR = myprj
MYPRJ_RESUME_DIR = myprj/resume
MYPRJ_RESUME_SRCS = $(shell find $(MYPRJ_RESUME_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)
myprj: myprj-resume.pdf

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

myprj-resume.pdf: $(MYPRJ_DIR)/resume.tex $(MYPRJ_RESUME_SRCS)
	$(CC) -output-directory=$(MYPRJ_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(MYPRJ_DIR)/*.pdf
