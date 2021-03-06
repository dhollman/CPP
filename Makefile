BUILDDIR = build

all: setup html 
	
setup:
	mkdir -p $(BUILDDIR)

html:
	find . -name "*.bs" -type f | sed 's/\.bs$$//' | xargs -I{} -t -n 1 sh -c "curl https://api.csswg.org/bikeshed/ -F file=@{}.bs -F force=1 > $(BUILDDIR)/{}.html"
	find . -name "*.md" -type f | sed 's/\.md$$//' | xargs -I{} -t -n 1 sh -c "grip {}.md --export $(BUILDDIR)/{}.html"

