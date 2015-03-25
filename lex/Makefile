
DIRS= contador identificadors enters mailing

.PHONY : all clean $(DIRS)

all: $(DIRS)

$(DIRS):
	@echo "## Doing $@ ##"
	@$(MAKE) all -C $@

clean:
	@for dir in $(DIRS); do \
		echo "Cleaning $$dir"; \
		(cd $$dir; $(MAKE) clean; cd .. );  \
	done
	$(RM) lex.zip

zip:
	svn export . lex
	zip -r lex.zip lex
	rm -R lex
