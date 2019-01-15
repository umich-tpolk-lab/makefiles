# Top level makefile
# make all will recursively make specified targets in each subject directory.

SUBJECTS=$(wildcard pmind????)


.PHONY: all $(SUBJECTS)

all: $(SUBJECTS)

$(SUBJECTS):
	$(MAKE) --directory=$@ $(TARGET)


print-%  : ; @echo $* = $($*)
