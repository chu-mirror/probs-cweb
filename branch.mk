EDITOR = sb

UPMAKE = dir=$$(dirname $$web_path); \
	target=$$dir/$$target; \
	cd ..; make $$target

.SUFFIXES: .w .pdf

.w.c:
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}
	
.w: 
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}

.w.pdf:
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}

new:
	@echo -n "new file's name: " && \
		read file && \
		echo -e "\
@* $$file.\n\
\n\
@c\n\
@<includes@>\n\
@<data@>\n\
@<prototypes@>\n\
\n\
\n\
@i des.wc\
" > $$file.w && \
		${EDITOR} $$file.w
	
new-folder:
	@echo -n "new folder's name: " && \
		read fold && \
		mkdir $$fold && \
		cp Makefile $$fold/Makefile

clean:
	$(RM) `ls | grep -v '\.w' | grep -v 'Makefile'`
