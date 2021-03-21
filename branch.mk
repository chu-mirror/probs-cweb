EDITOR = sb

UPMAKE = dir=$$(dirname $$web_path); \
	target=$$dir/$$target; \
	cd ..; make $$target

.SUFFIXES: .w .pdf

.w.c:
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}
	
.w: 
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}
	@if [ -f sample.c ]; then \
		make PROG=${@F} gen-test; \
	fi


.w.pdf:
	@web_path=$(realpath $<); target=${@F}; ${UPMAKE}

.PHONY: new new-folder clean clean-all gen-test refresh

new:
	@echo -n "new file's name: " && \
		read file && \
		echo -e "\
			@* $$file.\n\
			\n\
			@c\n\
			@<includes@>@/\n\
			@<data@>@/\n\
			@<prototypes@>\n\
			\n\
			\n\
			@i des.wc\
			" | tr -d "\t" > $$file.w && \
		${EDITOR} $$file.w
	
new-folder:
	@echo -n "new folder's name: " && \
		read fold && \
		mkdir $$fold && \
		cp Makefile $$fold/Makefile

clean:
	@${RM} `ls -p | grep -v '/' | grep -v '\.w' | grep -v 'Makefile'`

clean-all: clean
	@for dir in `ls -p | grep '/'`; do \
		cd $$dir; make clean-all; cd ..; \
	done
	@${RM} Makefile

refresh:
	@for dir in `ls -p | grep '/'`; do \
		ln -sf ../Makefile $$dir/Makefile; \
		cd $$dir; make refresh; cd ..; \
	done

gen-test: input output
	@echo -e "\
		#!/bin/sh\n\
		\n\
		i=0\n\
		max_case=\$$(./input)\n\
		while [ \$$i -lt \$$max_case ]; do\n\
			i=\$$(expr \$$i + 1)\n\
			case=\$$(./input \$$i | sed \"s/^/\t/\")\n\
			output=\"\$$(./input \$$i | ./${PROG} | sed \"s/[[:blank:]]*$$//\")\"\n\
			answer=\"\$$(./output \$$i)\"\n\
			if [ \"\$$output\" != \"\$$answer\" ]; then \n\
				echo -e \"Test case \$$i\\\\nInput:\\\\n\$$case\\\\nOutput:\"\n\
				echo \"\$$output\" | sed \"s/^/\t/\"\n\
				echo \"supposed:\"\n\
				echo \"\$$answer\" | sed \"s/^/\t/\"\n\
				echo -e \"\\\\n\"\n\
			fi\n\
		done\
		" | sed "/^\t/s/^\t//" > test
	@chmod +x test

output input: sample
	ln -sf $< $@

sample: ${PROG}
	${CC} -o sample sample.c

