# Top level makefile
# make all will recursively make specified targets in each subject directory.

SUBJECTS=$(wildcard mind????)

.PHONY: all $(SUBJECTS)

all: $(SUBJECTS) 

$(SUBJECTS):
	$(MAKE) --directory=$@ $(TARGET)


#Used to create pdfs to assess for quality in raw BOLD images, motion, 
#and behavior.



pdf: /nfs/tpolk/mind/subjects/B_M_Total.pdf /nfs/tpolk/mind/subjects/B_M_Sub.pdf /nfs/tpolk/mind/subjects/Subject.pdf /nfs/tpolk/mind/subjects/Field.pdf /nfs/tpolk/mind/bin/pdf.py

final_pdfs: /nfs/tpolk/mind/subjects/By_Field.pdf 

# This creates the pdf "B_M_Total".  This pdf lists all the flagged issues in behavior
# and motion.  It runs the matlab script "flags", which in turn runs another
# script "B_M_Total.m".

/nfs/tpolk/mind/subjects/B_M_Total.pdf: /nfs/tpolk/mind/data/mastersheet/mindmaster_clean.csv
	cd /nfs/tpolk/mind/data/mastersheet/ ; \
	matlab -nosplash -nodesktop -r "try, flags('/nfs/tpolk/mind/subjects/'), catch, 'Error running figs', end; exit"

# This creates the pdf "B_M_Sub".  This pdf lists all the flagged issues in behavior
# and motion, by subject.  It runs the matlab script "flags2" which in turn runs
# another script "B_M_Sub.m".  

/nfs/tpolk/mind/subjects/B_M_Sub.pdf: /nfs/tpolk/mind/data/mastersheet/mindmaster_clean.csv
	cd /nfs/tpolk/mind/data/mastersheet/ ; \
	matlab -nosplash -nodesktop -r "try, flags2('/nfs/tpolk/mind/subjects/'), catch, 'Error running figs', end; exit"

# This runs a python script "subject.py" which organizes all the pictures in Altered_Figs 
# by subject, in the order of behavior, motion, then BOLD.  

/nfs/tpolk/mind/subjects/Subject.pdf: /nfs/tpolk/mind/subjects/Altered_Figs /nfs/tpolk/mind/bin/subject.py
	python /nfs/tpolk/mind/bin/subject.py

# This runs a python script "field.py" which organizes all the pictures in Altered_Figs 
# by field, in the order of behavior, motion, then BOLD.  

/nfs/tpolk/mind/subjects/Field.pdf: /nfs/tpolk/mind/subjects/Altered_Figs	/nfs/tpolk/mind/bin/field.py
	python	/nfs/tpolk/mind/bin/field.py

/nfs/tpolk/mind/subjects/By_Field.pdf: /nfs/tpolk/mind/bin/pdf.py
	python /nfs/tpolk/mind/bin/pdf.py




print-%  : ; @echo $* = $($*)



