CFLAGS = -g
CWEBENV = CWEBINPUTS=include
CTANGLE = ${CWEBENV} ctangle
CWEAVE = ${CWEBENV} cweave

.SUFFIXES: .w .pdf .tex

.w.c:
	${CTANGLE} $< - $@

.w.tex:
	${CWEAVE} $< - $@
	
.tex.pdf:
	cd ${<D}; pdftex $<
	
new:
	@echo -n "new folder's name: " && \
		read fold && \
		mkdir $$fold && \
		cp branch.mk $$fold/Makefile

