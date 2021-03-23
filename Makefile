PLATFORMS = 

CFLAGS = -g
CWEBINPUTS = include
CTANGLE = CWEBINPUTS=$$CWEBINPUTS ctangle
CWEAVE = CWEBINPUTS=$$CWEBINPUTS cweave

.SUFFIXES: .w .pdf .tex

.w.c:
	@CWEBINPUTS=$$(realpath ${CWEBINPUTS}); \
		cd ${@D}; ${CTANGLE} $<

.w.tex:
	@CWEBINPUTS=$$(realpath ${CWEBINPUTS}); \
		cd ${@D}; ${CWEAVE} $< 
	
.tex.pdf:
	cd ${@D}; pdftex $<

.PHONY: new refresh clean
	
new:
	@echo -n "new folder's name: " && \
		read fold && \
		mkdir $$fold && \
		ln -s ../branch.mk $$fold/Makefile

refresh:
	@for dir in ${PLATFORMS}; do \
		ln -sf ../branch.mk $$dir/Makefile; \
		cd $$dir; make refresh; cd ..;\
	done
	
clean:
	@for dir in ${PLATFORMS}; do \
		cd $$dir; make clean-all; cd ..; \
	done

