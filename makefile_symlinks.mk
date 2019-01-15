# Top level makefile
# make will make symbolic links to the individual subject run01 directories. For example:

# ln -s /nfs/tpolk/mind/subjects/mindo100/placebo/func/auditory/run_01 expt-auditory/placebo/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/placebo/func/visual/run_01 expt-visual/placebo/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/placebo/func/tactile/run_01 expt-tactile/placebo/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/placebo/func/motor/run_01 expt-motor/placebo/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/drug/func/auditory/run_01 expt-auditory/drug/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/drug/func/visual/run_01 expt-visual/drug/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/drug/func/tactile/run_01 expt-tactile/drug/mindo100
# ln -s /nfs/tpolk/mind/subjects/mindo100/drug/func/motor/run_01 expt-motor/drug/mindo100

# Get the list of subjects
subjects=$(shell cat /nfs/tpolk/mind/lib/subjects)

# Get the current expt and condition
expt=$(shell pwd|egrep -o 'auditory|motor|visual|tactile')
condition=$(shell pwd|egrep -o 'drug|placebo')



.PHONY: all

all: $(subjects)

%: /nfs/tpolk/mind/subjects/%/$(condition)/func/$(expt)/run_01
	ln -s $< $@


