SHELL := /bin/bash

# Get the current experiment and session from the path
expt=$(shell pwd|egrep -o 'auditory|motor|tactile|visual|spectro|DTI')
session=$(shell pwd|egrep -o 'placebodti|mrs')
ifeq ($(expt),auditory)
   cond1=Music
   cond2=Speech
else ifeq ($(expt),motor)
   cond1=Right
   cond2=Left
else ifeq ($(expt),tactile)
   cond1=Right
   cond2=Left
else ifeq ($(expt),visual)
   cond1=Houses
   cond2=Faces
endif

# get subject id from the path
subject=$(shell pwd|egrep -o 'mind[oy][0-9][0-9][0-9]')

# get names of realigned files
tfile = $(wildcard t*run_01.nii)
rfile = $(wildcard r*run_01.nii)
srfile = s$(rfile)

# get names of MRS data files
MRSfiles = $(sort $(wildcard S?????_gaba*.?))

# Ugly syntax to (1) separate everything after "gaba" in the MRSfiles, (2) delete the
# separated prefixes, and (3) get rid of the suffix (e.g., ".7")
# The result is a list of simplified MRS directory target names
MRSdirs = $(basename $(filter-out %_, $(subst gaba, ,$(MRSfiles))))

# The following code figures out which dicom series correspond to each MRS scan
allseries = $(wildcard ../dicom/s000??)
NoOfSeries = $(words $(allseries))

NoOfMRSfiles = $(words $(MRSfiles))

FirstSeriesIndex = $(shell echo $$(($(NoOfSeries)-$(NoOfMRSfiles)+1)))

series = $(sort $(wordlist $(FirstSeriesIndex),$(NoOfSeries),$(allseries)))

# I couldn't figure out an elegant way to write a make recipe that makes the nth
# MRSmat depend on the nth series, so I decided to brute force it:
MRSmat1 = $(addsuffix /MRS.mat,$(word 1,$(MRSdirs)))
MRSmat2 = $(addsuffix /MRS.mat,$(word 2,$(MRSdirs)))
MRSmat3 = $(addsuffix /MRS.mat,$(word 3,$(MRSdirs)))
MRSmat4 = $(addsuffix /MRS.mat,$(word 4,$(MRSdirs)))
MRSmat5 = $(addsuffix /MRS.mat,$(word 5,$(MRSdirs)))
MRSmat6 = $(addsuffix /MRS.mat,$(word 6,$(MRSdirs)))
MRSmat7 = $(addsuffix /MRS.mat,$(word 7,$(MRSdirs)))


series1 = $(word 1,$(series))
series2 = $(word 2,$(series))
series3 = $(word 3,$(series))
series4 = $(word 4,$(series))
series5 = $(word 5,$(series))
series6 = $(word 6,$(series))
series7 = $(word 7,$(series))


deform1 = $(addsuffix /deform.nii,$(word 1,$(MRSdirs)))
deform2 = $(addsuffix /deform.nii,$(word 2,$(MRSdirs)))
deform3 = $(addsuffix /deform.nii,$(word 3,$(MRSdirs)))
deform4 = $(addsuffix /deform.nii,$(word 4,$(MRSdirs)))
deform5 = $(addsuffix /deform.nii,$(word 5,$(MRSdirs)))
deform6 = $(addsuffix /deform.nii,$(word 6,$(MRSdirs)))
deform7 = $(addsuffix /deform.nii,$(word 7,$(MRSdirs)))

mask1 = $(addsuffix /mask.nii,$(word 1,$(MRSdirs)))
mask2 = $(addsuffix /mask.nii,$(word 2,$(MRSdirs)))
mask3 = $(addsuffix /mask.nii,$(word 3,$(MRSdirs)))
mask4 = $(addsuffix /mask.nii,$(word 4,$(MRSdirs)))
mask5 = $(addsuffix /mask.nii,$(word 5,$(MRSdirs)))
mask6 = $(addsuffix /mask.nii,$(word 6,$(MRSdirs)))
mask7 = $(addsuffix /mask.nii,$(word 7,$(MRSdirs)))





# And here are the recipes

# Targets related to fMRI Model fitting
#--------------------------------------
.PHONY: fit fit_unsmooth fit_smooth fit_unsmBlocks fit_smBlocks 

fit: fit_unsmooth fit_smooth fit_unsmBlocks fit_smBlocks

fit_unsmooth: realign.txt GLM_unsmoothed/SPM.mat

fit_smooth: realign.txt GLM_smoothed/SPM.mat

fit_unsmBlocks: realign.txt GLM_unsmBlocks/SPM.mat

fit_smBlocks: realign.txt GLM_smBlocks/SPM.mat

realign.txt: realign.dat
	cp realign.dat realign.txt

GLM_unsmoothed/SPM.mat: $(rfile) GLM_unsmoothed
	matlab -nosplash -nodesktop -r "spm('defaults','fmri');spm_jobman('initcfg');matlabbatch=MakeSPMmat('$(subject)','$(expt)','$(session)','$(cond1)','$(cond2)','$<');spm_jobman('run',matlabbatch);exit"

GLM_unsmoothed:
	mkdir GLM_unsmoothed

GLM_unsmBlocks/SPM.mat: $(rfile) GLM_unsmBlocks
	matlab -nosplash -nodesktop -r "spm('defaults','fmri');spm_jobman('initcfg');matlabbatch=MakeSPMmatBlocks('$(subject)','$(expt)','$(session)','$(cond1)','$(cond2)','$<');spm_jobman('run',matlabbatch);exit"

GLM_unsmBlocks:
	mkdir GLM_unsmBlocks

GLM_smoothed/SPM.mat: $(srfile) GLM_smoothed
	matlab -nosplash -nodesktop -r "spm('defaults','fmri');spm_jobman('initcfg');matlabbatch=MakeSPMmat('$(subject)','$(expt)','$(session)','$(cond1)','$(cond2)','$<');spm_jobman('run',matlabbatch);exit"

GLM_smoothed:
	mkdir GLM_smoothed

GLM_smBlocks/SPM.mat: $(srfile) GLM_smBlocks
	matlab -nosplash -nodesktop -r "spm('defaults','fmri');spm_jobman('initcfg');matlabbatch=MakeSPMmatBlocks('$(subject)','$(expt)','$(session)','$(cond1)','$(cond2)','$<');spm_jobman('run',matlabbatch);exit"

GLM_smBlocks:
	mkdir GLM_smBlocks

.PHONY: cleanSPMmat cleanSPMmatUnsmoothed cleanSPMmatSmoothed 

cleanSPMmat: cleanSPMmatUnsmoothed cleanSPMmatSmoothed

cleanSPMmatUnsmoothed:
	rm GLM_unsmoothed/SPM.mat

cleanSPMmatSmoothed:
	rm GLM_smoothed/SPM.mat



# Targets related to GABA MRS analysis
#-------------------------------------
.PHONY: mrs savedmrs all normmrs newsavedmrs

all: savedmrs normmrs newsavedmrs

normmrs: norm_$(word 1,$(MRSdirs)) norm_$(word 2,$(MRSdirs)) norm_$(word 3,$(MRSdirs)) norm_$(word 4,$(MRSdirs)) norm_$(word 5,$(MRSdirs)) norm_$(word 6,$(MRSdirs)) norm_$(word 7,$(MRSdirs))

norm_$(word 1,$(MRSdirs)): $(deform1)
	cd $(word 1,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 2,$(MRSdirs)): $(deform2)
	cd $(word 2,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 3,$(MRSdirs)): $(deform3)
	cd $(word 3,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 4,$(MRSdirs)): $(deform4)
	cd $(word 4,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 5,$(MRSdirs)): $(deform5)
	cd $(word 5,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 6,$(MRSdirs)): $(deform6)
	cd $(word 6,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

norm_$(word 7,$(MRSdirs)): $(deform7)
	cd $(word 7,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRSvox2MNI('deform.nii', 'mask.nii'), catch, 'Error running MRSvox2MNI', end; exit" ;\
	touch ../$@

newsavedmrs: newsaved_$(word 1,$(MRSdirs)) newsaved_$(word 2,$(MRSdirs)) newsaved_$(word 3,$(MRSdirs)) newsaved_$(word 4,$(MRSdirs)) newsaved_$(word 5,$(MRSdirs)) newsaved_$(word 6,$(MRSdirs)) newsaved_$(word 7,$(MRSdirs))

newsaved_$(word 1,$(MRSdirs)): $(MRSmat1)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 1,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 2,$(MRSdirs)): $(MRSmat2)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 2,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 3,$(MRSdirs)): $(MRSmat3)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 3,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 4,$(MRSdirs)): $(MRSmat4)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 4,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 5,$(MRSdirs)): $(MRSmat5)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 5,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 6,$(MRSdirs)): $(MRSmat6)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 6,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@

newsaved_$(word 7,$(MRSdirs)): $(MRSmat7)
	matlab -nosplash -nodesktop -r "try, addgaba2('$(subject)', '/nfs/tpolk/mind/mrs/$(word 7,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba2', end; exit" ;\
	touch $@


savedmrs: saved_$(word 1,$(MRSdirs)) saved_$(word 2,$(MRSdirs)) saved_$(word 3,$(MRSdirs)) saved_$(word 4,$(MRSdirs)) saved_$(word 5,$(MRSdirs)) saved_$(word 6,$(MRSdirs)) saved_$(word 7,$(MRSdirs))

saved_$(word 1,$(MRSdirs)): $(MRSmat1)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 1,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 2,$(MRSdirs)): $(MRSmat2)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 2,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 3,$(MRSdirs)): $(MRSmat3)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 3,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 4,$(MRSdirs)): $(MRSmat4)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 4,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 5,$(MRSdirs)): $(MRSmat5)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 5,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 6,$(MRSdirs)): $(MRSmat6)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 6,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@

saved_$(word 7,$(MRSdirs)): $(MRSmat7)
	matlab -nosplash -nodesktop -r "try, addgaba('$(subject)', '/nfs/tpolk/mind/mrs/$(word 7,$(MRSdirs)).mat', '$<'), catch, 'Error running addgaba', end; exit" ;\
	touch $@


mrs: $(MRSmat1) $(MRSmat2) $(MRSmat3) $(MRSmat4) $(MRSmat5) $(MRSmat6) $(MRSmat7)


$(MRSmat1) $(deform1) $(mask1): $(word 1,$(MRSfiles)) $(series1)
	mkdir $(word 1,$(MRSdirs)) ;\
	cd $(word 1,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat2) $(deform2) $(mask2): $(word 2,$(MRSfiles)) $(series2)
	mkdir $(word 2,$(MRSdirs)) ;\
	cd $(word 2,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat3) $(deform3) $(mask3): $(word 3,$(MRSfiles)) $(series3)
	mkdir $(word 3,$(MRSdirs)) ;\
	cd $(word 3,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat4) $(deform4) $(mask4): $(word 4,$(MRSfiles)) $(series4)
	mkdir $(word 4,$(MRSdirs)) ;\
	cd $(word 4,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat5) $(deform5) $(mask5): $(word 5,$(MRSfiles)) $(series5)
	mkdir $(word 5,$(MRSdirs)) ;\
	cd $(word 5,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat6) $(deform6) $(mask6): $(word 6,$(MRSfiles)) $(series6)
	mkdir $(word 6,$(MRSdirs)) ;\
	cd $(word 6,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

$(MRSmat7) $(deform7) $(mask7): $(word 7,$(MRSfiles)) $(series7)
	mkdir $(word 7,$(MRSdirs)) ;\
	cd $(word 7,$(MRSdirs)) ;\
	matlab -nosplash -nodesktop -r "try, MRS = RunGannet('../$<', '../$(word 2,$^)'), save 'MRS.mat' MRS, catch, 'Error running RunGannet', end; exit" ;\
	mv ../*.nii . ;\
	mv ../*.mat . ;\
	mv y_*.nii deform.nii ;\
	mv S*mask.nii mask.nii

.PHONY: cleanmrs

cleanmrs:
	rm -r rightsensorymotor leftsensorymotor rightauditory leftauditory rightventrovisual leftventrovisual leftprimaryvisual ../anatomy/t1spgr_156sl/dicom/*tap* ../anatomy/t1spgr_156sl/dicom/*nii*


# Targets related to fMRI spatial smoothing
#------------------------------------------

.PHONY: smooth cleansmooth

smooth: s$(rfile)

s$(rfile): $(rfile)
	matlab -nosplash -nodesktop -r "try, spm_smooth('$<','$@',[8 8 8]), catch, 'Error running spm_smooth', end; exit"

cleansmooth:
	rm s$(rfile)


# Rules for making symbolic links
sessletter=$(shell pwd|egrep -o 'drug|placebo'|egrep -o 'd|p')
fsfastsession=/nfs/tpolk/mind/freesurfer/func/$(sessletter)$(subject)/$(expt)/001

.PHONY: makelinks

makelinks: $(fsfastsession)/f.nii $(fsfastsession)/$(cond1).$(cond2).par

$(fsfastsession)/f.nii: $(tfile)
	ln -s /nfs/tpolk/mind/subjects/$(subject)/$(session)/func/$(expt)/run_01/$< $@

$(fsfastsession)/$(cond1).$(cond2).par: /nfs/tpolk/mind/lib/$(cond1).$(cond2).par
	ln -s $< $@

# Rules for testing
test:
	@echo Testing that we are making $(subject) from session $(session) in experiment $(expt)

# Below is Shannon's makefile practice for dti

#FSfolder=/nfs/tpolk/mind/freesurfer/$(subject)/mri/
#cd /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP
#MRfolder=/nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP

#.PHONY: dwi_part1 

#dwi_part1: /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/dwi.mif


#/nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/dwi.mif: /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.nii /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.bvec /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.bval
 #   mrconvert /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.nii -fslgrad /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.bvec /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/topup_dtiDataSet.bval /nfs/tpolk/mind/dti/$(subject)/DTI_TOPUP_32/APPLYTOPUP/dwi.mif






print-%  : ; @echo $* = $($*)

# rules from other libraries

