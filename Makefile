OBJECTS	:= docs/trackviewerapp-info docs/trackviewerapp-policy

.PHONY = all

all: $(OBJECTS)

docs/trackviewerapp-info: trackviewer/Index.md
	mkdir $@
	Markdown_1.0.1/Markdown.pl $< | bash build_html.sh > $@/index.html

docs/trackviewerapp-policy: trackviewer/Privacy.md
	mkdir $@
	Markdown_1.0.1/Markdown.pl $< | bash build_html.sh > $@/index.html

clean:
	rm -r $(OBJECTS)
